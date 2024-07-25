import 'package:offline_first/app/features/customer/entities/customer_entity.dart';
import 'package:offline_first/app/features/customer/repository/i_customer_repository.dart';
import 'package:offline_first/core/services/client_service/i_rest_client.dart';
import 'package:offline_first/core/services/database/i_database.dart';

class CustomerRespository implements ICustomerRepository {
  final IRestClient clientHttp;
  final IDatabase localDatabase;

  CustomerRespository({required this.clientHttp, required this.localDatabase});

  @override
  Future<List<CustomerEntity>>? getCustomers({String? search, int? page}) async {
    var customer = CustomerEntity.empty();
    customer = customer.copywith(name: 'Aline', shopcode: '777777');

    return [];
  }
}




  //  var _uri =
  //       '$_url/$_getShopCode?page=${filterRequestParams.page}&
  // size=${filterRequestParams.size}
  // &sort=${filterRequestParams.sort?.getRequestFieldName}
  // &direction=${filterRequestParams.sort!.getOrderingMode.name}
  // &stats=${filterRequestParams.status}';
  //   if (filterRequestParams.search != null && filterRequestParams.search!.isNotEmpty) {
  //     _uri += '&search=${filterRequestParams.search}';
  //   }
  //   final _data = filterRequestParams.body?.toJson(paramsOptions: filterRequestParams.filter);
  //   final _response = await _dioRequestClient.post(
  //     _uri,
  //     data: _data,
  //     headers: _header,
  //     validateStatus: (status) => true,
  //   );
  //   if (_response.statusCode == HttpStatus.ok) {
  //     final _webCustomers = WebCustomers.fromJson(_response.data);
  //     return _webCustomers;
  //   } else if (_response.statusCode == HttpStatus.preconditionFailed ||
  //       _response.statusCode == HttpStatus.unauthorized) {
  //     await _authController.revalidateCredentials();
  //     final _retryResult = await getCustomers(filterRequestParams: filterRequestParams);
  //     return _retryResult;
  //   }
  //   return WebCustomers();