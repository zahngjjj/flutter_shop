import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/images/home.png",
      "active_icon": "lib/assets/images/home_active.png",
      "text": "首页",
    },
    {
      "icon": "lib/assets/images/home.png",
      "active_icon": "lib/assets/images/home_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/images/home.png",
      "active_icon": "lib/assets/images/home_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/images/home.png",
      "active_icon": "lib/assets/images/home_active.png",
      "text": "我的",
    },
  ];
  int _currentIndex = 0;
  List<Widget> _getChildren() {
    return _tabList.map((item) => Text(item["text"]!)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('主页')),
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _tabList
            .map(
              (item) => BottomNavigationBarItem(
                icon: Image.asset(item["icon"]!, width: 24, height: 24),
                activeIcon: Image.asset(
                  item["active_icon"]!,
                  width: 24,
                  height: 24,
                ),
                label: item["text"]!,
              ),
            )
            .toList(),
      ),
    );
  }
}
