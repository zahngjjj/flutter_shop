import 'package:flutter/material.dart';

class HmCategoryView extends StatefulWidget {
  HmCategoryView({Key? key}) : super(key: key);

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
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 100,
            color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              '分类$index',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
