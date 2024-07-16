import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers/UserNotifier.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs Home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<UserNotifier>(
              builder: (context, userNotifier, child) {
               return ListView.builder(
                 itemBuilder: (BuildContext context, int index) {
                   return ListTile(
                     title: Text(userNotifier.accessToken)
                   );
                 });
              }),
          )
        ],
      ),
    );
  }
}