import 'package:flutter/material.dart';

class HmMoreListView extends StatefulWidget {
  HmMoreListView({Key? key}) : super(key: key);

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
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text('商品', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
