// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_user_bloc.dart';

abstract class EditUserEvent {}

class DoEditUserEvent extends EditUserEvent {
  final AddUserRequestModel model;
  final int idUser;
  DoEditUserEvent(
    this.model,
    this.idUser,
  );
}
