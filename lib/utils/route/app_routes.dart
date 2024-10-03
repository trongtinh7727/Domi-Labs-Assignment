import 'package:domi/presentation/address/address_screen.dart';
import 'package:domi/presentation/home/home_screen.dart';
import 'package:domi/utils/route/route_names.dart';
import 'package:flutter/material.dart';

extension GenerateRoute on RouteSettings {
  dynamic get generateRoute {
    switch (name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.address:
        return MaterialPageRoute(
          builder: (context) => const AddressScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
