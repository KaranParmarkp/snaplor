import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jyotishee/app/utils/extensions.dart';
import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../app/utils/constants/api_config.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;
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
    //return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0Y2QyMzU2YTRiNTdiYzdjNDIxMmI0YyIsInJvbGUiOiJhc3Ryb2xvZ2VyIiwiZW1haWwiOiJrcDEwOTg4MkBnbWFpbC5jb20iLCJwaG9uZSI6Ijg0NjA0MTQ2MTciLCJ1c2VybmFtZSI6IlBhcm1lc2giLCJuYW1lIjoiS2FyYW4gIiwid2FsbGV0X2JhbGFuY2UiOjAsInByb2ZpbGVfaW1hZ2UiOiJodHRwczovL2p5b3Rpc2hlZS1maWxlcy5zMy5hbWF6b25hd3MuY29tL2FzdHJvbG9nZXJzLzY0Y2QyMzU2YTRiNTdiYzdjNDIxMmI0Yy9wcm9maWxlIiwiaWF0IjoxNjkyNjEzNjg5LCJleHAiOjE3MjQxNDk2ODl9.c7o6k3d85_mFYWlBwX8HDWuUdyDRDX-abmT3Kb2TSkw";
    //return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NzI1OWNjYTFkZjRjYjZlY2Y4YTdkOSIsInJvbGUiOiJhc3Ryb2xvZ2VyIiwiZW1haWwiOiJzdWhlbG5pZEBnbWFpbC5jb20iLCJwaG9uZSI6Ijk3MTYxMDgwNTUiLCJ1c2VybmFtZSI6IlBoYW5pYmh1c2hhbiIsIm5hbWUiOiJTdWhlbCBBaG1hZCIsImlhdCI6MTY5MTkwMzYzOSwiZXhwIjoxNzIzNDM5NjM5fQ.9I7wqvTRpiK6ScxhYJ78MRgspP-0djbOtktvpeUIcK0";
    return await MyApp.navKey.currentState!.context.read<AuthProvider>().userModel?.accessToken;
  }
  static Future<String?> getUserId() async {
    //return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0Y2QyMzU2YTRiNTdiYzdjNDIxMmI0YyIsInJvbGUiOiJhc3Ryb2xvZ2VyIiwiZW1haWwiOiJrcDEwOTg4MkBnbWFpbC5jb20iLCJwaG9uZSI6Ijg0NjA0MTQ2MTciLCJ1c2VybmFtZSI6IlBhcm1lc2giLCJuYW1lIjoiS2FyYW4gIiwid2FsbGV0X2JhbGFuY2UiOjAsInByb2ZpbGVfaW1hZ2UiOiJodHRwczovL2p5b3Rpc2hlZS1maWxlcy5zMy5hbWF6b25hd3MuY29tL2FzdHJvbG9nZXJzLzY0Y2QyMzU2YTRiNTdiYzdjNDIxMmI0Yy9wcm9maWxlIiwiaWF0IjoxNjkyNjEzNjg5LCJleHAiOjE3MjQxNDk2ODl9.c7o6k3d85_mFYWlBwX8HDWuUdyDRDX-abmT3Kb2TSkw";
    //return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NzI1OWNjYTFkZjRjYjZlY2Y4YTdkOSIsInJvbGUiOiJhc3Ryb2xvZ2VyIiwiZW1haWwiOiJzdWhlbG5pZEBnbWFpbC5jb20iLCJwaG9uZSI6Ijk3MTYxMDgwNTUiLCJ1c2VybmFtZSI6IlBoYW5pYmh1c2hhbiIsIm5hbWUiOiJTdWhlbCBBaG1hZCIsImlhdCI6MTY5MTkwMzYzOSwiZXhwIjoxNzIzNDM5NjM5fQ.9I7wqvTRpiK6ScxhYJ78MRgspP-0djbOtktvpeUIcK0";
    return await MyApp.navKey.currentState!.context.read<AuthProvider>().userModel?.id;
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


}

Future<String?> getSignedUrl({required bool isProfile,required File image}) async {
  final String apiUrl = 'https://api.snaplor.com/api/s3/pre-signed-url';
  final String? accessToken = await ApiService.getToken();
  final String? userId = await ApiService.getUserId();
  final Map<String, String> headers = {HttpHeaders.authorizationHeader: 'Bearer $accessToken',};
  final String contentType = 'image/jpeg';
  final String key = isProfile ? Uri.encodeComponent('users/${userId}/profile') : Uri.encodeComponent('posts/${userId}/postImage${DateTime.now().toIso8601String()}');
  final response = await http.get(
    Uri.parse('$apiUrl?key=$key&content_type=$contentType'),
    headers: headers,
  );
  if (response.statusCode == 200) {
    final dynamic data = jsonDecode(response.body);
    bool uploadResponse = await uploadImage(data["data"]["signedUrl"], image);
    if(uploadResponse==true){
      return data["data"]["url"];
    }else{
      return null;
    }
  } else {
    throw Exception('Failed to get signed URL');
  }
}
Future<bool> uploadImage(String signedUrl, File imageFile) async {

  var client = http.Client();
  var stream = http.ByteStream(imageFile.openRead());
  var request = http.Request(
    'PUT',
    Uri.parse(signedUrl),
  );
  request.headers['Content-Type'] = 'image/jpeg';
  request.bodyBytes = await stream.toBytes();
  var response = await client.send(request);
  'signedUrl: ${await response.request?.url}'.printDebug;
  'Response: ${await response.statusCode}'.printDebug;
  return response.statusCode == 200;
}
