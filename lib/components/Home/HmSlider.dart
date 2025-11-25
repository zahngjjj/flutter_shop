import 'package:flutter/material.dart';

class HmSliderView extends StatefulWidget {
  HmSliderView({Key? key}) : super(key: key);

  @override
  _HmSliderViewState createState() => _HmSliderViewState();
}

class _HmSliderViewState extends State<HmSliderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('轮播图', style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
