// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tugas1/data/remote_datasource/user_remote_datasource.dart';

import '../../data/models/response/delete_user)_response_model.dart';

part 'delete_user_event.dart';
part 'delete_user_state.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  final UserRemoteDatasource datasource;
  DeleteUserBloc(
    this.datasource,
  ) : super(DeleteUserInitial()) {
    on<DoDeleteUserEvent>((event, emit) async {
      emit(DeleteUserLoading());
      final result = await datasource.deleteUser(event.id);
      result.fold(
        (l) => emit(DeleteUserError(l)),
        (r) => emit(DeleteUserLoaded(r)),
      );
    });
  }
}
