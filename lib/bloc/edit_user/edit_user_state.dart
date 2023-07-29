part of 'edit_user_bloc.dart';


abstract class EditUserState {}

class EditUserInitial extends EditUserState {}
class EditUserLoading extends EditUserState {}
class EditUserLoaded extends EditUserState {
  final EditUserResponseModel model;
  EditUserLoaded(this.model);
}
class EditUserError extends EditUserState {
  final String message;
  EditUserError(this.message);
}

