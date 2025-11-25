import 'package:flutter/material.dart';

class HmHotView extends StatefulWidget {
  HmHotView({Key? key}) : super(key: key);

  @override
  _HmHotViewState createState() => _HmHotViewState();
}

class _HmHotViewState extends State<HmHotView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('爆款推荐', style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
