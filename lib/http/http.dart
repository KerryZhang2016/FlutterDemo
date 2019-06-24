import 'package:dio/dio.dart';

var dio = new Dio();
String baseUrl = "https://hq-dev.tigerfintech.com";

String watchlistPath = "/watchlist/get";

void initDio() {
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 5000; //5s
  dio.options.receiveTimeout = 3000;// 3s
  dio.options.headers = {"Authorization": "Bearer oX1BAfmZZEI2zTLob3QchLWrmDgVrQ"};
  dio.interceptors..add(LogInterceptor());
}