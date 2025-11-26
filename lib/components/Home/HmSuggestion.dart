import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodels/home.dart';

class HmSuggestionView extends StatefulWidget {
  HmSuggestionView({Key? key, this.preference}) : super(key: key);
  final SpecialRecommend? preference;

  @override
  _HmSuggestionViewState createState() => _HmSuggestionViewState();
}

class _HmSuggestionViewState extends State<HmSuggestionView> {
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        children: [
          Text('特惠推荐', style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(width: 10),
          Text('精选省功略', style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _getChildrenList() {
    final List<GoodsItem> items =
        (widget.preference?.subTypes.isNotEmpty ?? false)
        ? widget.preference!.subTypes.first.goodsItems.items
        : <GoodsItem>[];
    debugPrint('items: ${items.length}');
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
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('lib/assets/images/tuijian_bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [_buildHeader(), SizedBox(height: 8), _getChildrenList()],
      ),
    );
  }
}
