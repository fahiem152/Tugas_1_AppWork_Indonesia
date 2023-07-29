import 'dart:convert';

class DeleteUserResponseModel {
  String module;
  String message;
  int id;

  DeleteUserResponseModel({
    required this.module,
    required this.message,
    required this.id,
  });

  factory DeleteUserResponseModel.fromRawJson(String str) =>
      DeleteUserResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteUserResponseModel.fromJson(Map<String, dynamic> json) =>
      DeleteUserResponseModel(
        module: json["module"],
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "module": module,
        "message": message,
        "id": id,
      };
}
