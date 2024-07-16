import 'dart:convert';
class UserModel {
   late int id;
   late String email;
   late String name;
   late String accessToken;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        id: json['user']['id'],
        email: json['user']['email'],
        name: json['user']['name'],
        accessToken: json['user']['accessToken']
    );
  }

}