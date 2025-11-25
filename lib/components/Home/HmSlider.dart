import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodels/home.dart';

class HmSliderView extends StatefulWidget {
  final List<BannerItem> bannerList;
  HmSliderView({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HmSliderViewState createState() => _HmSliderViewState();
}

class _HmSliderViewState extends State<HmSliderView> {
  final TextEditingController _searchController = TextEditingController();
  final CarouselSliderController _controller = CarouselSliderController();

  int _current = 0;

  void _onSearchChanged(String value) {}
  void _onSearchSubmitted(String value) {
    if (value.isNotEmpty) {
      // 搜索商品
      print(value);
      _searchController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  Widget _getSlider() {
    // flutter 中获取屏幕宽度的方法
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 250,
      color: Colors.blue,
      alignment: Alignment.center,
      child: CarouselSlider(
        carouselController: _controller,
        items: List.generate(
          widget.bannerList.length,
          (index) => Container(
            color: Colors.white,
            child: Center(
              child: Image.network(
                widget.bannerList[index].imageUrl,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          height: 250,
          viewportFraction: 1,
          enlargeCenterPage: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
      ),
    );
  }

  Widget _getSliderSearch() {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.4),
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.search,
            style: TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: '搜索',
              hintStyle: TextStyle(color: Colors.white, fontSize: 16),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.bannerList.length,
            (index) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _controller.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                );
                setState(() {
                  _current = index;
                });
              },
              child: Container(
                width: 56,
                height: 40,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: _current == index ? 40 : 30,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _current == index ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  duration: Duration(milliseconds: 200),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSliderSearch(), _getDots()]);
  }
}
