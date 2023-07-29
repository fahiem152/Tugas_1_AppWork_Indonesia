import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas1/bloc/create_user/create_user_bloc.dart';
import 'package:tugas1/bloc/get_all_user/get_all_user_bloc.dart';
import 'package:tugas1/data/models/request/add_user_request_model.dart';
import 'package:tugas1/presentation/widgets/button_widget.dart';
import 'package:tugas1/presentation/widgets/text_input_widget.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add User Page'),
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
              BlocConsumer<CreateUserBloc, CreateUserState>(
                listener: (context, state) {
                  if (state is CreateUserLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Success Add User',
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
                  if (state is CreateUserError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Failed Add User',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CreateUserLoading) {
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
                          context
                              .read<CreateUserBloc>()
                              .add(DoCreateUserEvent(addProductModel));
                        
                      },
                      name: 'Add User');
                },
              )
            ],
          ),
        ));
  }
}
