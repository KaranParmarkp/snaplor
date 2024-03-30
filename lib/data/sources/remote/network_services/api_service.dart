import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/providers/providers.dart';

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
    //return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YWEzOWQyNzYxZGE0YzYwZWQzNGUwNiIsInJvbGUiOiJhc3Ryb2xvZ2VyIiwiZW1haWwiOiJzYW51Lmt1bWFyMTFAbWFpbC5jb20iLCJwaG9uZSI6IjkxMDY3NTQ0NzAiLCJjb3VudHJ5X2NvZGUiOiIrOTEiLCJmaXJzdF9uYW1lIjoiS3VtYXIiLCJsYXN0X25hbWUiOiJTYW51Iiwid2FsbGV0X2JhbGFuY2UiOjAsImlhdCI6MTcwNjY0MjQ5MSwiZXhwIjoxNzM4MTc4NDkxfQ.96HZpAO-zG5ASMo3AxMzXLmYqlCD3kIhMKzklkNZeXA";
    return await MyApp.navKey.currentState!.context
        .read<AuthProvider>()
        .userModel
        ?.accessToken;
  }

  static Future<String?> getUserId() async {
    return MyApp.navKey.currentState!.context
        .read<AuthProvider>()
        .userModel
        ?.id;
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
      {data, Options? options, queryParameters}) async {
    Response response = await _dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: await getDioHeaders()));
    Response<GenericResponse> result = Response<GenericResponse>(
        data: await GenericResponse.fromJson(
            response.data as Map<String, dynamic>),
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
    Response response = await _dio.put(path,
        data: data,
        options: options ?? Options(headers: await getDioHeaders()));
    Response<GenericResponse> result = Response<GenericResponse>(
        data: await GenericResponse.fromJson(
            response.data as Map<String, dynamic>),
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
    Response response = await _dio.get(path,
        queryParameters: queryParameters,
        options: options ?? await Options(headers: await getDioHeaders()));
    Response<GenericResponse> result = Response<GenericResponse>(
        data: await GenericResponse.fromJson(
            response.data as Map<String, dynamic>),
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
    Response response = await _dio.delete(path,
        queryParameters: queryParameters,
        options: options ?? await Options(headers: await getDioHeaders()));
    Response<GenericResponse> result = Response<GenericResponse>(
        data: await GenericResponse.fromJson(
            response.data as Map<String, dynamic>),
        requestOptions: response.requestOptions,
        extra: response.extra,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage);
    return result;
  }

  static Future<String?> sendFileToS3({
    required String url,
    required File file,
  }) async {
    Dio _dio = Dio();
    var len = await file.length();
    print("url--->$url");
    String? token = await getToken();
    final getUrl = await getS3Url(url: url);
    print(getUrl.data != null);
    if (getUrl.data != null) {
      print("calling main");
      String u = getUrl.data["data"]["signedUrl"];
      print(u);
      try {
        var response = await _dio.put(
          u,
          data: FormData.fromMap({
            'file': await MultipartFile.fromFile(
              file.path,
              contentType: MediaType('image', 'jpeg'),
            ),
          }),
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'content-type' : 'image/jpeg'
            },
          ),
        );
        print("response of main");
        print(response);
        if (response.statusCode == 200) {
          return getUrl.data["data"]["signedUrl"];
        } else {
          print("Failed to upload file. Status code: ${response.statusCode}");
          print("Response data: ${response.data}");
          return null;
        }
      } catch (e) {
        print("Error uploading file: $e");
        print("Error uploading file: ${e}");
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<Response> getS3Url({required String url}) async {
    Dio _dio = Dio();
    String? token = await getToken();
    var response = await _dio.get(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    print(response.data);
    return response;
  }

}
