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
  List<BannerItem> _bannersList = [];
  List<CategoryItem> _categoryList = [];
  SpecialRecommend? _preference;
  SpecialRecommend? _oneStop;
  SpecialRecommend? _inVogue;
  List<RecommendItem> _recommendList = [];

  List<Widget> _buildSlivers() {
    return [
      SliverToBoxAdapter(child: HmSliderView(bannerList: _bannersList)),
      SliverToBoxAdapter(child: HmCategoryView(categoryList: _categoryList)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: HmSuggestionView(preference: _preference),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HmHotView(oneStop: _oneStop, title: '爆款推荐'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHotView(oneStop: _inVogue, title: '一站买全'),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreListView(RecommendList: _recommendList),
    ];
  }

  @override
  void initState() {
    super.initState();
    _feachBannerList();
    _feachCategoryList();
    _feachPreference();
    _feachOneStop();
    _feachInVogue();
    _feachRecommendList();
  }

  void _feachBannerList() async {
    _bannersList = await getBannerList();
    setState(() {});
  }

  void _feachCategoryList() async {
    _categoryList = await getCategoryList();
    setState(() {});
  }

  void _feachPreference() async {
    _preference = await getPreference();
    setState(() {});
  }

  void _feachOneStop() async {
    _oneStop = await getOneStop();
    setState(() {});
  }

  void _feachInVogue() async {
    _inVogue = await getInVogue();
    setState(() {});
  }

  void _feachRecommendList() async {
    _recommendList = await getRecommendList({'limit': 10});
    setState(() {});
  }

  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _buildSlivers());
  }
}
