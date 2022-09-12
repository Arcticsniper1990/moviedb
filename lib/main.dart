import 'package:flutter/material.dart';
import 'package:movie_bd/widgets/main_screen/main_screen_widget.dart';

import 'widgets/auth/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(3, 37, 65, 1))
      ),
  routes: {
        '/': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
  },
  initialRoute: '/',
  //     home: MainScreenWidget(),
    );
  }
}