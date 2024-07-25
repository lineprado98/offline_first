import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline_first/app/features/customer/pages/list_customer_controller.dart';

class ListCustomerPage extends StatefulWidget {
  const ListCustomerPage({super.key});

  @override
  State<ListCustomerPage> createState() => _ListCustomerPageState();
}

class _ListCustomerPageState extends State<ListCustomerPage> {
  late ListCustomerController controller;

  @override
  void initState() {
    super.initState();
    // Localiza o controller
    controller = Get.find<ListCustomerController>();

    controller.fetchCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Adicione funcionalidade extra aqui se necessário
              Navigator.pop(context);
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        drawer: Drawer(),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.fetchCustomer();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(children: [
              ListTile(
                title: Text('titulo'),
                subtitle: Text('titulo'),
              ),
              ListTile(
                title: Text('titulo'),
                subtitle: Text('titulo'),
              ),
            ]),
          ),
        ));
  }
}
