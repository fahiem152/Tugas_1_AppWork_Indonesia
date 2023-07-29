// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tugas1/data/models/request/add_user_request_model.dart';
import 'package:tugas1/data/remote_datasource/user_remote_datasource.dart';

import '../../data/models/response/edit_user_response_model.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  final UserRemoteDatasource datasource;
  EditUserBloc(
    this.datasource,
  ) : super(EditUserInitial()) {
    on<DoEditUserEvent>((event, emit) async {
      emit(EditUserLoading());
      final result = await datasource.editUser(event.model, event.idUser);
      result.fold(
        (l) => emit(EditUserError(l)),
        (r) => emit(EditUserLoaded(r)),
      );
    });
  }
}
