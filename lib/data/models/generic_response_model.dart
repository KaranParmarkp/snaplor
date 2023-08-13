import 'package:jyotishee/app/utils/utils.dart';

class GenericResponse<T> {
  bool code;
  String message;
  T? data;

  GenericResponse({required this.code, this.data, required this.message});

  factory GenericResponse.fromJson(Map<String, dynamic> json) =>
      GenericResponse(
          code: json["data"] != null ? true : false,//if response contains data means it is success
          message: json["error"]!=null ? json["error"]["message"] : json["data"]!=null && (json["data"] is List<dynamic>)==false ? json["data"]["message"]:  "",
          data: json["data"]);

}
abstract class FromJsonModel<T> {
  T fromJsonHelp(Map<String, dynamic> json);
  static Type typeOf<T>() => T;
}