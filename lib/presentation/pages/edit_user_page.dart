import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tugas1/bloc/edit_user/edit_user_bloc.dart';
import 'package:tugas1/bloc/get_all_user/get_all_user_bloc.dart';
import 'package:tugas1/data/models/request/add_user_request_model.dart';
import 'package:tugas1/data/models/response/users_response_model.dart';
import 'package:tugas1/presentation/widgets/button_widget.dart';
import 'package:tugas1/presentation/widgets/text_input_widget.dart';

class EditUserPage extends StatefulWidget {
  final DatumUser user;
  const EditUserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.user.fristName;
    lastNameController.text = widget.user.lastName;
    emailController.text = widget.user.email;
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit User Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextInputWidget(
                controller: firstNameController,
                pleaceholder: 'Frist Name',
              ),
              const SizedBox(
                height: 20,
              ),
              TextInputWidget(
                controller: lastNameController,
                pleaceholder: 'Last Name',
              ),
              const SizedBox(
                height: 20,
              ),
              TextInputWidget(
                controller: emailController,
                pleaceholder: 'Email',
              ),
              const SizedBox(
                height: 40,
              ),
              BlocConsumer<EditUserBloc, EditUserState>(
                listener: (context, state) {
                  if (state is EditUserLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Success Edit User',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    firstNameController.clear();
                    lastNameController.clear();
                    emailController.clear();
                    Navigator.pop(context);
                    context.read<GetAllUserBloc>().add(DoGetAllUserEvent());
                  }
                  if (state is EditUserError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Failed Edit User',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is EditUserLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ButtonWidget(
                    onTap: () {
                      final addProductModel = AddUserRequestModel(
                        fristName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                      );
                      context.read<EditUserBloc>().add(
                          DoEditUserEvent(addProductModel, widget.user.id));
                    },
                    name: 'Edit User',
                  );
                },
              )
            ],
          ),
        ));
  }
}
