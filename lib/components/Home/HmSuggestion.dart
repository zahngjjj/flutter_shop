import 'package:flutter/material.dart';

class HmSuggestionView extends StatefulWidget {
  HmSuggestionView({Key? key}) : super(key: key);

  @override
  _HmSuggestionViewState createState() => _HmSuggestionViewState();
}

class _HmSuggestionViewState extends State<HmSuggestionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('推荐', style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
