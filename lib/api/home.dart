// 封装一个api 目的是返回业务侧要的数据结构
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter_shop/constants/index.dart';
import 'package:flutter_shop/utils/DioRequest.dart';
import 'package:flutter_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerList() async {
  final response = await dioRequest.get(HttpConstants.BANNER_LIST);
  return (response as List)
      .map((item) => BannerItem.fromJSON(item as Map<String, dynamic>))
      .toList();
}

// 分类列表
Future<List<CategoryItem>> getCategoryList() async {
  final response = await dioRequest.get(HttpConstants.CATEGORY_LIST);
  dev.log(jsonEncode(response), name: 'home_api');
  return (response as List)
      .map((item) => CategoryItem.fromJSON(item as Map<String, dynamic>))
      .toList();
}

// 特别推荐
Future<SpecialRecommend> getPreference() async {
  final response = await dioRequest.get(HttpConstants.PREFERENCE_LIST);
  dev.log(jsonEncode(response), name: 'home_api');
  return SpecialRecommend.fromJSON(response as Map<String, dynamic>);
}

// 一站买全
Future<SpecialRecommend> getOneStop() async {
  final response = await dioRequest.get(HttpConstants.ONE_STOP_LIST);
  dev.log(jsonEncode(response), name: 'home_api');
  return SpecialRecommend.fromJSON(response as Map<String, dynamic>);
}

// 爆款推荐
Future<SpecialRecommend> getInVogue() async {
  final response = await dioRequest.get(HttpConstants.IN_VOGUE_LIST);
  dev.log(jsonEncode(response), name: 'home_api');
  return SpecialRecommend.fromJSON(response as Map<String, dynamic>);
}

// 推荐列表
Future<List<RecommendItem>> getRecommendList(queryParameters) async {
  final response = await dioRequest.get(
    HttpConstants.RECOMMEND_LIST,
    queryParameters: queryParameters,
  );
  dev.log(jsonEncode(response), name: 'home_api');
  return (response as List)
      .map((item) => RecommendItem.fromJSON(item as Map<String, dynamic>))
      .toList();
}
