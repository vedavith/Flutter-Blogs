import 'package:provider/provider.dart';
import 'package:vani_ashok_blogs/controller/login/LoginController.dart';
import 'package:vani_ashok_blogs/model/login/LoginModel.dart';
import 'package:vani_ashok_blogs/view/home/HomeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../notifiers/UserNotifier.dart';

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
      body: Container(
        constraints: BoxConstraints.expand(
          height: Theme.of(context).textTheme.headlineMedium!.fontSize! * 5.0 + 200.0,
        ),
        padding: const EdgeInsets.all(10),
        // color: Colors.blue[600],
        alignment: Alignment.center,
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
                onPressed: () async {
                  bool isValid =
                  await validateLogin(usernameController, passwordController);
                  if (!isValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid Details")));
                  } else {
                    // Calling Provider
                    Provider.of<UserNotifier>(context, listen: false);
                    //Navigate to home
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView())
                    );
                  }
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }

  validateLogin(
      TextEditingController username, TextEditingController password) async {
    if (username.text == '' || password.text == '') {
      return false;
    }
    final LoginModel userDetails =
    LoginModel(username: username.text, password: password.text);
    return await loginController.loginValidation(userDetails);
  }
}