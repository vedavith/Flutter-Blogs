class UserModel {
   late int userId;
   late String email;
   late String name;
   late String accessToken;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        userId: json['userId'] ?? 0,
        email: json['email'],
        name: json['name'],
        accessToken: json['accessToken'] ?? ""
    );
  }

   Map<String, dynamic> toJson() {
     return {
       'id': userId,
       'email': email,
       'name': name
     };
   }
}