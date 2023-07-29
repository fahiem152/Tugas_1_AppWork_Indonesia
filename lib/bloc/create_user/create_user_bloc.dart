import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas1/data/models/response/add_user_response_model.dart';
import 'package:tugas1/data/remote_datasource/user_remote_datasource.dart';

import '../../data/models/request/add_user_request_model.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final UserRemoteDatasource datasource;
  CreateUserBloc(this.datasource) : super(CreateUserInitial()) {
    on<DoCreateUserEvent>((event, emit) async {
      emit(CreateUserLoading());
      final result = await datasource.createUser(event.model);
      result.fold(
        (l) => emit(CreateUserError(l)),
        (r) => emit(CreateUserLoaded(r)),
      );
    });
  }
}
