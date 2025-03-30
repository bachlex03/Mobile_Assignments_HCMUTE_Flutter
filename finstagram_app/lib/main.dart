import 'package:finstagram_app/pages/home.page.dart';
import 'package:finstagram_app/pages/login.page.dart';
import 'package:finstagram_app/pages/register.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finstagram App',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: "home",
      routes: {
        "home": (context) => HomePage(),
        "register": (context) => RegisterPage(),
        "login": (context) => LoginPage(),
      },
    );
  }
}
