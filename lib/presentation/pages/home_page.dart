import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas1/bloc/get_all_user/get_all_user_bloc.dart';
import 'package:tugas1/presentation/pages/edit_user_page.dart';

import '../../bloc/delete_user/delete_user_bloc.dart';
import 'add_user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllUserBloc>().add(DoGetAllUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddUserPage()));
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<GetAllUserBloc, GetAllUserState>(
          builder: (context, state) {
            if (state is GetAllUserLoaded) {
              return ListView.builder(
                  itemCount: state.model.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(
                        20,
                      ),
                      padding: const EdgeInsets.all(
                        16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                              0.5,
                            ),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                              0,
                              3,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 24,
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 16,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              color: Colors.purpleAccent,
                            ),
                            child: Text(
                              state.model.data[index].id.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            '${state.model.data[index].fristName} ${state.model.data[index].lastName}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            state.model.data[index].email,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditUserPage(
                                          user: state.model.data[index],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Delete User'),
                                            content: const Text(
                                                'Are you sure want to delete this user?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content:
                                                          Text('User deleted'),
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                  context
                                                      .read<DeleteUserBloc>()
                                                      .add(
                                                        DoDeleteUserEvent(state
                                                            .model
                                                            .data[index]
                                                            .id),
                                                      );
                                                  context
                                                      .read<GetAllUserBloc>()
                                                      .add(DoGetAllUserEvent());
                                                },
                                                child: const Text('Yes'),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
