// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/response/users_response_model.dart';
import '../../data/remote_datasource/user_remote_datasource.dart';

part 'get_all_user_event.dart';
part 'get_all_user_state.dart';

class GetAllUserBloc extends Bloc<GetAllUserEvent, GetAllUserState> {
  final UserRemoteDatasource datasource;
  GetAllUserBloc(
    this.datasource,
  ) : super(GetAllUserInitial()) {
    on<DoGetAllUserEvent>((event, emit) async {
      emit(GetAllUserLoading());
      final result = await datasource.getUsers();
      result.fold(
        (l) => emit(GetAllUserError(l)),
        (r) => emit(GetAllUserLoaded(r)),
      );
    });
  }
}
