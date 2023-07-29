part of 'delete_user_bloc.dart';

abstract class DeleteUserState {}

class DeleteUserInitial extends DeleteUserState {}

class DeleteUserLoading extends DeleteUserState {}

class DeleteUserLoaded extends DeleteUserState {
  final DeleteUserResponseModel model;

  DeleteUserLoaded(this.model);
}

class DeleteUserError extends DeleteUserState {
  final String message;
  DeleteUserError(this.message);
}
