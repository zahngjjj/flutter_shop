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
  Widget _getSlider() {
    // flutter 中获取屏幕宽度的方法
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 250,
      color: Colors.blue,
      alignment: Alignment.center,
      child: CarouselSlider(
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
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }
}
