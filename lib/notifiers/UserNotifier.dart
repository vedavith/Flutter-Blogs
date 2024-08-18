
import 'package:flutter/material.dart';
import '../model/login/UserModel.dart';

class UserNotifier extends ChangeNotifier {

  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  late String _email = '';

  String get email => _email;

  late int _id = 0;

  int get id => _id;

  late String _name = '';

  String get name => _name;

  late String _accessToken = '';

  String get accessToken => _accessToken;

  void setUserData(UserModel model) {
    _email = model.email;
    _id = model.userId;
    _accessToken = model.accessToken;
    _name = model.name;
    notifyListeners();
  }

  void setUsers(List<UserModel> newUsers) {
    _users = newUsers;
    notifyListeners();
  }

  void logout() {
    _email = '';
    _id = 0;
    _accessToken = '';
    _name = '';
    notifyListeners();
  }
}