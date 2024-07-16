
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/login/UserModel.dart';

class UserNotifier extends ChangeNotifier {

  late String _email = '';

  String get email => _email;

  late int _id = 0;

  int get id => _id;

  late String _name = '';

  String get name => _name;

  late String _accessToken = '';

  String get accessToken => _accessToken;

  bool setUserData(UserModel model) {
    _email = model.email;
    _id = model.id;
    _accessToken = model.accessToken;
    _name = model.name;
    notifyListeners();
    return true;
  }

  void logout() {
    _email = '';
    _id = 0;
    _accessToken = '';
    _name = '';
    notifyListeners();
  }
}