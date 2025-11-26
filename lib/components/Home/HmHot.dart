import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodels/home.dart';

class HmHotView extends StatefulWidget {
  HmHotView({Key? key, this.oneStop, this.title}) : super(key: key);

  SpecialRecommend? oneStop;
  String? title;

  @override
  _HmHotViewState createState() => _HmHotViewState();
}

class _HmHotViewState extends State<HmHotView> {
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        children: [
          Text(
            widget.title ?? '',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _getChildrenList() {
    final List<SpecialSubType> subs = widget.oneStop?.subTypes ?? [];
    final int pickIndex = (widget.title == '爆款推荐')
        ? 0
        : (subs.isNotEmpty ? subs.length - 1 : 0);
    debugPrint(
      'HmHot title=${widget.title} subs=${subs.length} pick=$pickIndex',
    );
    final List<GoodsItem> items = subs.isNotEmpty
        ? subs[pickIndex].goodsItems.items
        : <GoodsItem>[];
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.picture,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) =>
                        Container(width: 80, height: 80, color: Colors.white24),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 80,
                  child: Text(
                    item.name,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFFE74C3C),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    '¥${item.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isHot = (widget.title == '爆款推荐');
    final Color bgColor = isHot
        ? const Color(0xFFcae0ed)
        : const Color(0xFFf9f4d8);
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [_buildHeader(), SizedBox(height: 8), _getChildrenList()],
      ),
    );
  }
}
