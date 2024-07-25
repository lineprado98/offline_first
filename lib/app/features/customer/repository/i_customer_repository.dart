import 'package:offline_first/app/features/customer/entities/customer_entity.dart';

abstract class ICustomerRepository {
  Future<List<CustomerEntity>>? getCustomers({
    String? search,
    int? page,
  });
}
