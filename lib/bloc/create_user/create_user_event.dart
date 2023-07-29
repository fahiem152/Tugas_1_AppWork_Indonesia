part of 'create_user_bloc.dart';

abstract class CreateUserEvent {}

class DoCreateUserEvent extends CreateUserEvent {
  final AddUserRequestModel model;

  DoCreateUserEvent(this.model);
}
