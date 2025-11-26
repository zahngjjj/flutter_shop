// 基于Dio 进行二次封装
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/index.dart';
import 'dart:convert';
import 'dart:developer' as dev;

class DioRequest {
  // 初始化Dio
  final _dio = Dio();
  DioRequest() {
    _dio.options.baseUrl = GlobConstants.BASE_URL;
    _dio.options.connectTimeout = Duration(
      milliseconds: GlobConstants.CONNECT_TIMEOUT,
    );
    _dio.options.receiveTimeout = Duration(
      milliseconds: GlobConstants.RECEIVE_TIMEOUT,
    );
    _addInterceptors();
  }
  // 拦截器
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint('RES ${response.statusCode}');
          if (response.statusCode == 200) {
            return handler.next(response);
          }
          return handler.reject(
            DioException(requestOptions: response.requestOptions),
          );
        },
        onError: (DioException e, handler) {
          // 在发生错误之前做一些事情
          return handler.next(e);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters}) {
    return _handleResponse(_dio.get(url, queryParameters: queryParameters));
  }

  Future<dynamic> _handleResponse(Future<Response<dynamic>> future) async {
    try {
      final Response<dynamic> response = await future;
      final body = response.data;

      if (body is Map<String, dynamic>) {
        final codeRaw = body['code'] ?? body['status'];
        final successRaw = body['success'];
        final int? code = codeRaw is int
            ? codeRaw
            : (codeRaw is String ? int.tryParse(codeRaw) : null);
        final bool ok =
            (successRaw == true) ||
            (code == GlobConstants.SUCCESS_CODE) ||
            (code == 200);
        if (ok) {
          return body['result'] ?? body['data'] ?? body;
        }
        throw Exception(body['msg'] ?? '数据加载异常~');
      }
      return body;
    } catch (e) {
      throw Exception(e);
    }
  }

  String _stringify(dynamic value) {
    try {
      if (value is Map || value is List) return jsonEncode(value);
      return value?.toString() ?? 'null';
    } catch (_) {
      return value?.toString() ?? 'null';
    }
  }
}

extension on Response<dynamic> {
  void operator [](String other) {}
}
// 实例对象

final dioRequest = DioRequest();

// dio请求工具发出的请求 返回的数据 Response<dynamic>.data
// 把所有的接口的data解放出来,拿到真正的数据,要判断业务状态码是不是等于1
