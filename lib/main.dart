import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas1/bloc/create_user/create_user_bloc.dart';
import 'package:tugas1/bloc/delete_user/delete_user_bloc.dart';
import 'package:tugas1/bloc/edit_user/edit_user_bloc.dart';
import 'package:tugas1/bloc/get_all_user/get_all_user_bloc.dart';
import 'package:tugas1/data/remote_datasource/user_remote_datasource.dart';
import 'package:tugas1/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateUserBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetAllUserBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => EditUserBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DeleteUserBloc(UserRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomePage(),
      ),
    );
  }
}
