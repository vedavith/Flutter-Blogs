class LoginModel {
  LoginModel({required this.usermail, required this.password});

  late String usermail;
  late String password;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['usermail'] = usermail;
    data['password'] = password;
    return data;
  }

  LoginModel.fromJson(Map<String, dynamic> json) {
    usermail = json['usermail'];
    password = json['password'];
  }
}
