import 'package:avrs_ca/controller/login/LoginController.dart';
import 'package:avrs_ca/model/login/LoginModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = LoginController();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  bool isValid =
                      validateLogin(usernameController, passwordController);
                  if (!isValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid Details")));
                  }
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }

  validateLogin(
      TextEditingController username, TextEditingController password) {
    if (username.text == '' || password.text == '') {
      return false;
    }
    final LoginModel userDetails =
        LoginModel(usermail: username.text, password: password.text);
    return loginController.loginValidation(userDetails);
  }
}
