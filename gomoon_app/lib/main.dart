import 'package:flutter/material.dart';
import 'package:gomoon_app/pages/home.page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GoMoon",
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
      ),
      home: HomePage(),
    );
  }
}
