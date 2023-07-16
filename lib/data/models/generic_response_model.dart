class GenericResponse<T> {
  bool code;
  String message;
  T? data;

  GenericResponse({required this.code, this.data, required this.message});

  factory GenericResponse.fromJson(Map<String, dynamic> json) =>
      GenericResponse(
          code: json["code"] == "success" ? true : false,
          message: json["message"] ?? "",
          data: json["data"]);
          //data: T.fromJson(json["data"]));
}
abstract class FromJsonModel<T> {
  T fromJsonHelp(Map<String, dynamic> json);
  static Type typeOf<T>() => T;
}