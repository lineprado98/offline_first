import 'auxiliaries/client_response.dart';

abstract class IRestClient {
  Future<ClientResponse> get({
    required String path,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? header,
  });

  Future<ClientResponse> post({
    required String path,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? extra,
  });
}
