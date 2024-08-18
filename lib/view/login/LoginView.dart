import 'package:provider/provider.dart';
import 'package:vani_ashok_blogs/controller/login/LoginController.dart';
import 'package:vani_ashok_blogs/controller/blogs/BlogsController.dart';
import 'package:vani_ashok_blogs/model/login/LoginModel.dart';
import 'package:vani_ashok_blogs/model/login/UserModel.dart';
import 'package:vani_ashok_blogs/view/home/HomeView.dart';
import 'package:flutter/material.dart';


import '../../model/blog/BlogModel.dart';
import '../../notifiers/UserNotifier.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = LoginController();
  final BlogsController blogsController = BlogsController();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<BlogModel> _blogs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBlogs();
  }

  Future<void> _fetchBlogs() async {
    try {
      List<BlogModel> blogs = await blogsController.getAllBlogs();
      setState(() {
        _blogs = blogs; // Assuming this is a list of maps or model objects
        _isLoading = false;
      });
    } catch (e) {
      // Handle errors
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load blogs: $e'), duration: Duration(seconds: 10)),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vani Ashok Blogs'),
        actions: [
          // Email and Password TextFields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // Email Field
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Space between fields
                SizedBox(width: 8.0),
                // Password Field
                SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 8.0),
                SizedBox(
                  width:200,
                  child:  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0), // Rounded corners
                        ),
                        elevation: 5, // Shadow effect
                      ),
                      onPressed: () async {
                        var users =
                        await validateLogin(usernameController, passwordController);
                        if (users is UserModel) {
                          // Calling Provider
                          Provider.of<UserNotifier>(context, listen: false).setUsers([users]);
                          //Navigate to home
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeView())
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Invalid Details")));
                        }
                      },
                      child: const Text('Login')),
                )
              ],
            ),
          ),
        ],
        backgroundColor: Colors.redAccent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.white54,
            height: 1.0,
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _blogs.length,
        itemBuilder: (context, index) {
          final blog = _blogs[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(blog.content),
                ],
              ),
            ),
          );
        },
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