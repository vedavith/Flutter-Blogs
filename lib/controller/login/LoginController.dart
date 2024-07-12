import 'dart:convert';
import 'package:avrs_ca/controller/BaseController.dart';
import 'package:avrs_ca/model/login/LoginModel.dart';
import 'package:flutter/material.dart';

class LoginController extends Basecontroller {
  LoginController();

  loginValidation(LoginModel login) {
    super.doPost('v0/auth', login.toJson());
    return true;
  }
}
