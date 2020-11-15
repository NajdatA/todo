import 'package:flutter/material.dart';
import 'package:flutter_app/features/home/presentation/pages/add_page.dart';
// import 'file:///C:/Users/ASUS/AndroidStudioProjects/flutter_app/lib/features/home/presentation/pages/add_page.dart';
import 'package:flutter_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_app/features/login/presentation/pages/login_page.dart';
import 'package:flutter_app/features/splash/presentation/pages/splash_page.dart';

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String name = value.name;
    String args = value.arguments;
    switch(name) {
      case NameScreen.SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) {
          return SplashPage();
        });
        break;
      case NameScreen.LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) {
          return LoginPage();
        });
        break;
      case NameScreen.HOME_SCREEN:
        return MaterialPageRoute(builder: (_) {
          return HomePage();
        });
        break;
      case NameScreen.ADD_SCREEN:
        return MaterialPageRoute(builder: (_) {
          return AddPage();
        });
        break;
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

class NameScreen {
  static const SPLASH_SCREEN = '/splash';
  static const LOGIN_SCREEN = '/login';
  static const HOME_SCREEN = '/home';
  static const ADD_SCREEN = '/add';
}