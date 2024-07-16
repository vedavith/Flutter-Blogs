import 'dart:convert';
import 'package:vani_ashok_blogs/controller/BaseController.dart';
import 'package:vani_ashok_blogs/model/login/LoginModel.dart';
import 'package:vani_ashok_blogs/model/login/UserModel.dart';
import 'package:vani_ashok_blogs/notifiers/UserNotifier.dart';


class LoginController extends BaseController {
  var userNotifier = UserNotifier();

  Future<dynamic> loginValidation(LoginModel login) async {
    final response = await doPost('/login/auth', login.toJson());
    var responseModel = UserModel.fromJson(jsonDecode(response));
    return userNotifier.setUserData(responseModel);
  }

  void logout() {
    return userNotifier.logout();
  }


}