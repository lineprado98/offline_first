import 'package:dio/dio.dart' as dio;

class ClientResponse {
  final dynamic data;
  final int statusCode;
  final StackTrace? stackTrace;

  const ClientResponse({
    required this.data,
    required this.statusCode,
    this.stackTrace,
  });

  factory ClientResponse.fromDio(dio.Response? response, dio.DioException? exception) {
    return ClientResponse(
      data: response?.data ?? exception?.response?.data,
      statusCode: response?.statusCode ?? exception!.response?.statusCode ?? 500,
      stackTrace: exception?.stackTrace,
    );
  }
}
