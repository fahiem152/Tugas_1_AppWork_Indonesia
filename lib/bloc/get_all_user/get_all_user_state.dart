part of 'get_all_user_bloc.dart';

abstract class GetAllUserState {}

class GetAllUserInitial extends GetAllUserState {}

class GetAllUserLoading extends GetAllUserState {}

class GetAllUserLoaded extends GetAllUserState {
  final UsersResponseModel model;
  GetAllUserLoaded(this.model);
}

class GetAllUserError extends GetAllUserState {
  final String message;
  GetAllUserError(this.message);
}
