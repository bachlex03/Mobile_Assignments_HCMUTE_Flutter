import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _title(),
              _loginForm(),
              _loginBtn(),
              _registerPageLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(
      "Finstagram",
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _deviceHeight! * 0.20,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_emailField(), _passwordField()],
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Email"),
      onSaved:
          (value) => {
            setState(() {
              _email = value;
            }),
          },
      validator: (value) {
        bool? result = value?.contains(
          RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"),
        );
        return result == true ? null : "Invalid email address";
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "Password"),
      onSaved:
          (value) => {
            setState(() {
              _password = value;
            }),
          },
      validator: (value) {
        bool? result = value!.length > 6;

        return result == true ? null : "Password must be at least 6 characters";
      },
    );
  }

  Widget _loginBtn() {
    return MaterialButton(
      onPressed: _loginAsync,
      minWidth: _deviceWidth! * 0.70,
      height: _deviceHeight! * 0.06,
      color: Colors.red,
      child: const Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget _registerPageLink() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "register");
      },
      child: const Text(
        "Don't have an account? Register",
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  void _loginAsync() {
    print(_formKey.currentState!.validate());

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Email: $_email, Password: $_password");
    }
  }
}
