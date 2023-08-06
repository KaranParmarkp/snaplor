import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../app/utils/constants/api_config.dart';
import '../../../../main.dart';

abstract class ApiService {
  final Dio _dio;

  ApiService({BaseOptions? options})
      : _dio = Dio(options ??
            BaseOptions(
              baseUrl: ApiConfig.apiUrl,
              connectTimeout: Duration(seconds: 10),
              receiveTimeout: Duration(seconds: 10),
            )) {
    if (kDebugMode)
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (requestOptions, handler) {
            log(
                "REQUEST[${requestOptions.method}] => ${ApiConfig.apiUrl + requestOptions.path}"
                " => REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers} => DATA: ${requestOptions.data} \n",
                name: 'REQUEST [${requestOptions.path}]');
            return handler.next(requestOptions);
          },
          onResponse: (response, handler) {
            log("RESPONSE [${response.statusCode}] => DATA: ${response.data} \n",
                name: "RESPONSE [${response.requestOptions.path}]");
            return handler.next(response);
          },
          onError: (err, handler) {
            log("ERROR[${err.response?.statusCode}] => DATA: ${err.response?.data}",
                name: "ERROR [${err.requestOptions.path}]");
            return handler.next(err);
          },
        ),
      );
  }

  static Future<String?> getToken() async {
    return await MyApp.navKey.currentState!.context.read<AuthProvider>().userModel?.accessToken;
  }

  Future<Map<String, String>> getDioHeaders() async {
    final String? token = await getToken();
    return {
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
      'Authorization': 'Bearer ${token}',
    };
  }

  Future<Response<GenericResponse>> postData(String path,
      {data, Options? options,queryParameters}) async {
    Response response = await _dio.post(path,data: data,queryParameters: queryParameters, options: options ?? Options(headers: await getDioHeaders()));
    Response<GenericResponse> result = Response<GenericResponse>(
        data: await GenericResponse.fromJson(response.data as Map<String, dynamic>),
        requestOptions: response.requestOptions,
        extra: response.extra,
        headers: response.headers,
      isRedirect: response.isRedirect,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage);
    return result;
  }

  Future<Response<GenericResponse>> putData(String path,
      {data, Options? options}) async {
    Response response = await _dio.put(path, data: data, options: options ?? Options(headers: await getDioHeaders()));
    Response<GenericResponse> result = Response<GenericResponse>(
        data: await GenericResponse.fromJson(response.data as Map<String, dynamic>),
        requestOptions: response.requestOptions,
        extra: response.extra,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage);
    return result;
  }

  Future<Response<GenericResponse>> getData(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {

    Response response =  await _dio.get(path,
        queryParameters: queryParameters,
        options: options ?? await Options(headers: await getDioHeaders()));
    Response<GenericResponse> result = Response<GenericResponse>(
        data: await GenericResponse.fromJson(response.data as Map<String, dynamic>),
        requestOptions: response.requestOptions,
        extra: response.extra,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage);
    return result;
  }

  Future<Response<GenericResponse>> deleteData(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {

    Response response =  await _dio.delete(path,
        queryParameters: queryParameters,
        options: options ?? await Options(headers: await getDioHeaders()));
    Response<GenericResponse> result = Response<GenericResponse>(
        data: await GenericResponse.fromJson(response.data as Map<String, dynamic>),
        requestOptions: response.requestOptions,
        extra: response.extra,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage);
    return result;
  }

   static dynamic webSocketChannel() async {
    final res =  IOWebSocketChannel.connect(Uri.parse(ApiConfig.baseUrlSocket),headers: {
      'Authorization': 'Bearer ${getToken()}',
    });
    return res.stream;
  }
}
