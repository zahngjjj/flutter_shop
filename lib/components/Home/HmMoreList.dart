import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodels/home.dart';

class HmMoreListView extends StatefulWidget {
  HmMoreListView({Key? key, required this.RecommendList}) : super(key: key);
  final List<RecommendItem> RecommendList;

  @override
  _HmMoreListViewState createState() => _HmMoreListViewState();
}

class _HmMoreListViewState extends State<HmMoreListView> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.18,
      ),
      itemCount: widget.RecommendList.length,
      itemBuilder: (context, index) {
        final item = widget.RecommendList[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          // padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  item.picture,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stack) =>
                      Container(height: 120, color: Colors.black12),
                ),
              ),
              SizedBox(height: 8),
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¥${item.price}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '付款人数：${item.payCount}',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
