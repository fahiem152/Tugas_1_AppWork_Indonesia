import 'dart:convert';

class EditUserResponseModel {
  String module;
  String message;
  int id;
  DataUser dataUser;

  EditUserResponseModel({
    required this.module,
    required this.message,
    required this.id,
    required this.dataUser,
  });

  factory EditUserResponseModel.fromRawJson(String str) =>
      EditUserResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EditUserResponseModel.fromJson(Map<String, dynamic> json) =>
      EditUserResponseModel(
        module: json["module"],
        message: json["message"],
        id: json["id"],
        dataUser: DataUser.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "module": module,
        "message": message,
        "id": id,
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
