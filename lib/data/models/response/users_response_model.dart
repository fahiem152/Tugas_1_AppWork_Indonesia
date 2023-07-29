import 'dart:convert';

class UsersResponseModel {
  String module;
  List<DatumUser> data;
  int dataCount;
  Params params;

  UsersResponseModel({
    required this.module,
    required this.data,
    required this.dataCount,
    required this.params,
  });

  factory UsersResponseModel.fromRawJson(String str) =>
      UsersResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) =>
      UsersResponseModel(
        module: json["module"],
        data: List<DatumUser>.from(
            json["data"].map((x) => DatumUser.fromJson(x))),
        dataCount: json["data_count"],
        params: Params.fromJson(json["params"]),
      );

  Map<String, dynamic> toJson() => {
        "module": module,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount,
        "params": params.toJson(),
      };
}

class DatumUser {
  String fristName;
  String lastName;
  String email;
  int id;

  DatumUser({
    required this.fristName,
    required this.lastName,
    required this.email,
    required this.id,
  });

  factory DatumUser.fromRawJson(String str) =>
      DatumUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatumUser.fromJson(Map<String, dynamic> json) => DatumUser(
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

class Params {
  Params();

  factory Params.fromRawJson(String str) => Params.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Params.fromJson(Map<String, dynamic> json) => Params();

  Map<String, dynamic> toJson() => {};
}
