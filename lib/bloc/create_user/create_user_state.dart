part of 'create_user_bloc.dart';

abstract class CreateUserState {}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoading extends CreateUserState {}

class CreateUserLoaded extends CreateUserState {
  final AddUserResponseModel model;

  CreateUserLoaded(this.model);
}

class CreateUserError extends CreateUserState {
  final String message;

  CreateUserError(this.message);
}
