import 'package:dio/dio.dart';
import '../auxiliaries/client_response.dart';
import '../auxiliaries/i_custom_header.dart';
import '../i_rest_client.dart';

class DioService implements IRestClient {
  late final Dio _dio;
  final ICustomHeader customHeader;

  DioService({required this.customHeader}) {
    _dio = Dio(_option(baseUrl: 'http://localhost'));
    _dio.interceptors.addAll(_setInterceptors());
  }

  static BaseOptions _option({required String baseUrl}) {
    return BaseOptions(baseUrl: baseUrl);
  }

  List<Interceptor> _setInterceptors() {
    return [
      InterceptorsWrapper(
        onResponse: (response, handler) {
          final refreshToken = response.requestOptions.extra['refreshToken'];

          if (response.statusCode == 401) {
            if (refreshToken) {
              print('REFRESH TOKEN ');
              customHeader.getHeaderAutenticated();
            }
          }
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          // Processa o erro antes de retorná-lo
          final refreshToken = error.response?.requestOptions.extra['refreshToken'];

          if (error.response?.statusCode == 401) {
            if (refreshToken) {
              print('REFRESH TOKEN ');
              customHeader.getHeaderAutenticated();
            }
          }
          return handler.next(error);
        },
      )
    ];
  }

  @override
  Future<ClientResponse> post({required String path, Map<String, dynamic>? header, Map<String, dynamic>? body, Map<String, dynamic>? parameters, Map<String, dynamic>? extra}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<ClientResponse> get({
    required String path,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? header,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: parameters,
        options: Options(
          headers: header,
          extra: extra,
        ),
      );
      return ClientResponse.fromDio(response, null);
    } on DioException catch (error) {
      return ClientResponse.fromDio(null, error);
    }
  }
}
