import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:vani_ashok_blogs/view/login/LoginView.dart';

/// Notifiers
import 'package:vani_ashok_blogs/notifiers/UserNotifier.dart';


void main() {
  HttpOverrides.global = MyHttpOverrides();
  // runApp(const MyApp());
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserNotifier())
        ], 
        child: const MyApp()
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vani Ashok Blogs',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.red, brightness: Brightness.light),
          useMaterial3: true,
        ),
        home: const LoginView());
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}