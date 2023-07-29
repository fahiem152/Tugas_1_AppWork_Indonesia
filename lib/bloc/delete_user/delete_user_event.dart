part of 'delete_user_bloc.dart';

abstract class DeleteUserEvent {}

class DoDeleteUserEvent extends DeleteUserEvent {
  final int id;

  DoDeleteUserEvent(this.id);
}
