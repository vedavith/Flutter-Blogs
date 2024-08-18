import 'dart:convert';
import 'package:vani_ashok_blogs/controller/BaseController.dart';
import 'package:vani_ashok_blogs/model/login/LoginModel.dart';
import 'package:vani_ashok_blogs/model/login/UserModel.dart';

class LoginController extends BaseController {
  Future<dynamic> loginValidation(LoginModel login) async {
    final response = await doPost('/login/auth', login.toJson());
    return UserModel.fromJson(jsonDecode(response)['user']);
  }
}