import 'package:offline_first/core/exceptions/custom_exception.dart';

import 'auxiliaries/client_response.dart';

class RestErrorType {
  static CustomException handler(ClientResponse response) {
    switch (response.statusCode) {
      case 401:
        return Unauthorized();
      case 404:
        return NotFound();
      default:
        return InternalError();
    }
  }
}
