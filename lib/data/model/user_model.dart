class UserModel {

  String? fullName;
  String? userName;
  String? email;
  String? phoneNumber;

  UserModel({this.fullName, this.userName, this.email, this.phoneNumber,});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

}