import 'package:flutter/material.dart';
import 'package:flutter_shop/components/Home/HmCategory.dart';
import 'package:flutter_shop/components/Home/HmHot.dart';
import 'package:flutter_shop/components/Home/HmMoreList.dart';
import 'package:flutter_shop/components/Home/HmSlider.dart';
import 'package:flutter_shop/components/Home/HmSuggestion.dart';
import 'package:flutter_shop/viewmodels/home.dart';
import 'package:flutter_shop/api/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannersList = [
    // BannerItem(
    //   id: '1',
    //   imageUrl:
    //       'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg',
    // ),
    // BannerItem(
    //   id: '2',
    //   imageUrl:
    //       'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png',
    // ),
    // BannerItem(
    //   id: '3',
    //   imageUrl:
    //       'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg',
    // ),
  ];
  List<Widget> _buildSlivers() {
    return [
      SliverToBoxAdapter(child: HmSliderView(bannerList: _bannersList)),
      SliverToBoxAdapter(child: HmCategoryView()),
      SliverToBoxAdapter(child: HmSuggestionView()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHotView()),
              SizedBox(width: 10),
              Expanded(child: HmHotView()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreListView(),
    ];
  }

  @override
  void initState() {
    super.initState();
    _feachBannerList();
  }

  void _feachBannerList() async {
    _bannersList = await getBannerList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _buildSlivers());
  }
}
