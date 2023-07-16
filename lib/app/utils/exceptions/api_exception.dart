class ApiException implements Exception {
  final String? _message;

  ApiException(String? message) : _message = message;

  String? get message => _message;

  @override
  String toString() {
    return _message ?? "sa";
  }
}
