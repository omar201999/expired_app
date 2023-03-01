
class UserModel {
  final String id;
  final String name;
  final String email;
  final String token;
  //final String? image;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    //this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'api_token': token,
      //'image': image
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['userName'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      //image: json['image'] as String?,
    );
  }


}
