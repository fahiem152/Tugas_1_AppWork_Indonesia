import 'dart:convert';

class AddUserResponseModel {
  String module;
  String message;
  DataUser dataUser;

  AddUserResponseModel({
    required this.module,
    required this.message,
    required this.dataUser,
  });

  factory AddUserResponseModel.fromRawJson(String str) =>
      AddUserResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddUserResponseModel.fromJson(Map<String, dynamic> json) =>
      AddUserResponseModel(
        module: json["module"],
        message: json["message"],
        dataUser: DataUser.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "module": module,
        "message": message,
        "data": dataUser.toJson(),
      };
}

class DataUser {
  String fristName;
  String lastName;
  String email;
  int id;

  DataUser({
    required this.fristName,
    required this.lastName,
    required this.email,
    required this.id,
  });

  factory DataUser.fromRawJson(String str) =>
      DataUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        fristName: json["frist_name"],
        lastName: json["last_name"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "frist_name": fristName,
        "last_name": lastName,
        "email": email,
        "id": id,
      };
}
