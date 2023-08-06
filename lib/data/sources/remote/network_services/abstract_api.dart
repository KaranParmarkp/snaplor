import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/main.dart';
import 'package:jyotishee/presentation/screens/auth/login/login_screen.dart';
import '../../../models/error_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
abstract class AbstractApi {
  final String errorsKey = 'error';
  final String successKey = 'success';
  final String messageKey = 'message';
  final String dataKey = 'data';
  final String codeKey = 'code';

  String? _getErrorMessage(Map<String, dynamic> responseBody) {
    if (responseBody.containsKey(errorsKey) && responseBody[errorsKey].length > 0) {
      List<ErrorModel> errors = [];
      responseBody[errorsKey].forEach((key, value) {
        List<String> errorsStringsList = [];
        value.forEach((item) {
          errorsStringsList.add(item);
        });
        errors.add(
            ErrorModel(name: key, errorStringsList: errorsStringsList.first));
      });

      List<String> stringList = [];
      errors.forEach((element) {
        stringList.add(element.errorStringsList);
      });

      var joinedStringList = stringList.join("\n");

      return joinedStringList;
    }
    return null;
  }

  Future<T> serviceHandler<T>({
    required Future<Response <GenericResponse> > Function() serviceFunction,
    required Future<T> Function(GenericResponse response) successFunction,
  }) async {
    final network = await networkConnected();

    if (!network) {
      return throw ApiException(AppStrings.networkException);
    }
    try{
      final response = await serviceFunction();
      var result = response.data;
      if (result.isNotNull) {
        if (response.statusCode == 200 && result?.code==true) {
          return successFunction(result!);
        } else {
          return throw ApiException(result?.message);
        }
      } else {
        return throw ApiException(AppStrings.noBodyException);
      }
    } on TimeoutException {
      return throw ApiException(AppStrings.timeOutException);
    }
    on SocketException {
      return throw ApiException(AppStrings.socketException);
    }
    on DioException catch (dioError) {
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          return throw ApiException(AppStrings.clientConnectionException);
        case DioExceptionType.receiveTimeout:
          return throw ApiException(AppStrings.clientNoResponseException);
        case DioExceptionType.badResponse:
          switch (dioError.response?.statusCode) {
            case 400:
              MyApp.appContext.pushRemoveUntil(LoginScreen());
              return throw ApiException('${dioError.response!.statusCode}: ${dioError.response!.statusMessage}');
            case 401:
              final String? message = dioError.response!.data[messageKey];
              return throw ApiException(message ??
                  '${dioError.response!.statusCode}: ${dioError.response!.statusMessage}');
            case 403:
              return throw ApiException(
                  '${dioError.response!.statusCode}: ${dioError.response!.statusMessage}');
            case 422:
              final String? errorMessage = _getErrorMessage(dioError.response!.data);
              return throw ApiException(errorMessage);
            case 451:
              final String? message = dioError.response!.data[messageKey];
              return throw ApiException(message ??
                  '${dioError.response!.statusCode}: ${dioError.response!.statusMessage}');
            case 500:
              return throw ApiException(
                  '${dioError.response!.statusCode}: ${dioError.response!.statusMessage}');
            default:
              return throw ApiException(
                  '${dioError.response!.statusCode}: ${dioError.response!.statusMessage}');
          }
        case DioExceptionType.sendTimeout:
          return throw ApiException(AppStrings.clientSendReqException);
        case DioExceptionType.cancel:
          return throw ApiException(AppStrings.clientReqCancelException);
        default:
          return throw ApiException(/*AppStrings.unexpectedException*/dioError.error.toString());
      }
    }
  }
  Future<bool> networkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.ethernet ) {
      // I am connected to a wifi network.
      return true;
    } else {
      return false;
    }
  }
}

