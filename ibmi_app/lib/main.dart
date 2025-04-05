import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi_app/pages/history.page.dart';
import 'package:ibmi_app/pages/ibmi.page.dart';
import 'package:ibmi_app/pages/main.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "IBMI App",
      initialRoute: "/",
      routes: {
        "/": (context) => MainPage(),
        "ibmi": (context) => IBMIPage(),
        "history": (context) => HistoryPage(),
      },
    );
  }
}
