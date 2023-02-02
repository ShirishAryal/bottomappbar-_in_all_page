import 'package:flutter/material.dart';
import 'package:navigation_tes/home_page.dart';

import 'setting_page.dart';

class NitvTaskRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/secondpage':
        return MaterialPageRoute(builder: (_) => const SecondPage());
      case '/settingpage':
        return MaterialPageRoute(builder: (_) => const SettingPage());
      case '/settingdetail':
        return MaterialPageRoute(builder: (_) => const SettingDetailPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
