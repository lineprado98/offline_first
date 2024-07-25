import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_router/go_router.dart';
import 'package:offline_first/app/features/home/pages/home_page.dart';

class AppRoutes {
//   static final routes = GetPage(
//     page: () => const HomePage(title: ''),
//     name: '/',
//     children: [
//       GetPage(
//         name: '',
//         page: () => HomePage(title: 'Home'),
//       ),
//     ],
//   );}

  static final routes = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage(
          title: 'Home',
        );
      },
    ),
  ]);
}
