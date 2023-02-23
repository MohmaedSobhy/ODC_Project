class SignModel {
  String? code;
  String? message;
  UserData? data;

  SignModel({this.code, this.message, this.data});

  SignModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? email;
  String? password;
  String? name;
  String? gender;
  String? phoneNumber;
  int? roleId;

  UserData(
      {this.email,
      this.password,
      this.name,
      this.gender,
      this.phoneNumber,
      this.roleId});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['gender'] = gender;
    data['phoneNumber'] = phoneNumber;
    data['roleId'] = roleId;
    return data;
  }
}
