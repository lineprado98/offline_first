import 'package:get/instance_manager.dart';
import 'package:offline_first/app/features/customer/pages/list_customer_controller.dart';
import 'package:offline_first/app/features/customer/repository/customer_respository.dart';
import 'package:offline_first/app/features/customer/repository/i_customer_repository.dart';
import 'package:offline_first/core/services/client_service/i_rest_client.dart';
import 'package:offline_first/core/services/database/i_database.dart';

class CustomerBindings {
  static void getBindings() {
    Get.put<ICustomerRepository>(
      CustomerRespository(
        clientHttp: Get.find<IRestClient>(),
        localDatabase: Get.find<IDatabase>(),
      ),
    );
    Get.lazyPut(
      () => ListCustomerController(
        customerRepository: Get.find<ICustomerRepository>(),
      ),
    );

    Get.put(ListCustomerController(
      customerRepository: Get.find(),
    ));
  }
}
