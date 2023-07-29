import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas1/common/url_constant.dart';
import 'package:tugas1/data/models/request/add_user_request_model.dart';
import 'package:tugas1/data/models/response/add_user_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:tugas1/data/models/response/delete_user)_response_model.dart';
import 'package:tugas1/data/models/response/edit_user_response_model.dart';
import 'package:tugas1/data/models/response/users_response_model.dart';

class UserRemoteDatasource {
  Future<Either<String, UsersResponseModel>> getUsers() async {
    final response = await http.get(
      Uri.parse("${UrlConstants.baseUrl}/users"),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('getUsers response: ${response.body}');
    if (response.statusCode == 200) {
      return Right(UsersResponseModel.fromRawJson(response.body));
    } else {
      return const Left('Gagal Get Users');
    }
  }

  Future<Either<String, AddUserResponseModel>> createUser(
      AddUserRequestModel model) async {
    final response = await http.post(
      Uri.parse("${UrlConstants.baseUrl}/users"),
      body: model.toRawJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('createUser response: ${response.body}');
    if (response.statusCode == 200) {
      return Right(AddUserResponseModel.fromRawJson(response.body));
    } else {
      return const Left('Gagal Create User');
    }
  }

  Future<Either<String, EditUserResponseModel>> editUser(
      AddUserRequestModel model, int idUser) async {
    final response = await http.post(
      Uri.parse("${UrlConstants.baseUrl}/users/$idUser"),
      body: model.toRawJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('editUser response: ${response.body}');
    if (response.statusCode == 200) {
      return Right(EditUserResponseModel.fromRawJson(response.body));
    } else {
      return const Left('Gagal Edit User');
    }
  }

  Future<Either<String, DeleteUserResponseModel>> deleteUser(int idUser) async {
    final response = await http.delete(
      Uri.parse("${UrlConstants.baseUrl}/users/$idUser"),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('deleteUser response: ${response.body}');
    if (response.statusCode == 200) {
      return Right(DeleteUserResponseModel.fromRawJson(response.body));
    } else {
      return const Left('Gagal Delete User');
    }
  }
}
