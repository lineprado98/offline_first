import 'package:get/get_rx/get_rx.dart';
import 'package:offline_first/app/features/customer/entities/customer_entity.dart';
import 'package:offline_first/app/features/customer/repository/i_customer_repository.dart';

class ListCustomerController {
  final ICustomerRepository customerRepository;

  ListCustomerController({required this.customerRepository});

  late RxList<CustomerEntity> listCustomer;

  void fetchCustomer() async {
    await customerRepository.getCustomers();
  }

  void onRefresh() async {}
}
