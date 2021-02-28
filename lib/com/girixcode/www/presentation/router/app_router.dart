import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/presentation/screens/settings_screen.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/presentation/screens/third_screen.dart';

class AppRouter {
  // final CounterCubit _counterCubit = CounterCubit();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => MyHomePage(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
        break;
      case "/second":
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            color: Colors.red,
            title: "Second Screen",
          ),
        );
        break;
      case "/third":
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: "Third Screen",
            color: Colors.orange,
          ),
        );
        break;
      case "/settings":
        return MaterialPageRoute(
          builder: (_) => SettingScreen(
            title: "Setting Screen",
            color: Colors.teal,
          ),
        );
        break;
      default:
        return null;
    }
  }

  void dispose() {
    // BlocProvider Closes The Instance Automatically Only When It is Created Inside Create Method.
    // Here We Have To Close Manually As Instance Isnt Created By BlocProvider.
    // _counterCubit.close();
  }
}
