import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodels/home.dart';

class HmCategoryView extends StatefulWidget {
  HmCategoryView({Key? key, this.categoryList = const []}) : super(key: key);

  final List<CategoryItem> categoryList;

  @override
  _HmCategoryViewState createState() => _HmCategoryViewState();
}

class _HmCategoryViewState extends State<HmCategoryView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          final item = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            width: 90,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.picture,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) => Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  item.name,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
