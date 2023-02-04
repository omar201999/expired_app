
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../constants/end_points.dart';


class WebService {
  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  static WebService? _this;
  final String _baseURL = baseUrl;

  Dio publicDio = Dio();
  Dio privateDio = Dio();


  WebService._() {
    publicDio.options.baseUrl = _baseURL;
    publicDio.options.headers;
    privateDio.options.baseUrl = _baseURL;
    publicDio.options.connectTimeout = 45000;
    privateDio.options.connectTimeout = 45000;
    initializeInterceptors();
  }

  initializeInterceptors() {
    privateDio.interceptors.clear();
    publicDio.interceptors.clear();

    publicDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers = {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          };
          debugPrint('send request ${options.uri}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');
          //debugPrint('data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          debugPrint(response.data.toString());
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('data: ${e.response?.data}');
          debugPrint('-----------------------------------------------');
          if (e.response?.statusCode == 400) {
            EasyLoading.dismiss();
            return handler.next(e);
          }
          else if (e.response?.statusCode == 401) {

            EasyLoading.dismiss();
            return handler.next(e);
          } else if (e.response?.statusCode == 403) {

            EasyLoading.dismiss();
            return handler.next(e);
          } else if (e.response?.statusCode == 500) {

            EasyLoading.dismiss();
            //ToastService.showUnExpectedErrorToast();
          }
          else if (e.response?.statusCode == 415) {

            EasyLoading.dismiss();
            //ToastService.showUnExpectedErrorToast();
          }
          else if (e.response?.statusCode == 422) {
            EasyLoading.dismiss();
            //ToastService.showUnExpectedErrorToast();
          }
        },
      ),
    );

    privateDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Do something before request is sent
          debugPrint('send request ${options.uri}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('Data: ${options.data}');
          debugPrint('-----------------------------------------------');
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse: (response, handler) async {
          debugPrint(response.data.toString());
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('data: ${e.response?.data}');
          debugPrint('-----------------------------------------------');
          if (e.response?.statusCode == 422) {
            EasyLoading.dismiss();
            return handler.next(e);
          } else if (e.response?.statusCode == 400) {
            EasyLoading.dismiss();
            return handler.next(e);
          } else if (e.response?.statusCode == 401) {
            EasyLoading.dismiss();
            return handler.next(e);
          } else if (e.response?.statusCode == 500) {
            EasyLoading.dismiss();
            //ToastService.showUnExpectedErrorToast();
          }
        },
      ),
    );
  }
}
