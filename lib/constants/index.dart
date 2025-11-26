// 定义全局常量数据, 基础地址, 超时时间,业务状态
class GlobConstants {
  // 基础地址
  static const String BASE_URL = 'https://meikou-api.itheima.net';

  static const int CONNECT_TIMEOUT = 5000;

  static const int RECEIVE_TIMEOUT = 5000;
  // 业务状态
  static const int SUCCESS_CODE = 1;
}

// 接口的常量数据
class HttpConstants {
  static const String BANNER_LIST = '/home/banner';
}
