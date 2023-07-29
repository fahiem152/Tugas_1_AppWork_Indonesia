import 'dart:convert';

class AddUserRequestModel {
  String fristName;
  String lastName;
  String email;

  AddUserRequestModel({
    required this.fristName,
    required this.lastName,
    required this.email,
  });

  factory AddUserRequestModel.fromRawJson(String str) =>
      AddUserRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddUserRequestModel.fromJson(Map<String, dynamic> json) =>
      AddUserRequestModel(
        fristName: json["frist_name"],
        lastName: json["last_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "frist_name": fristName,
        "last_name": lastName,
        "email": email,
      };
}
