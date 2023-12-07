import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/domain/usecase/auth_usecases.dart';
import 'package:task_app/injector.dart';
import 'package:task_app/presentation/auth_provider.dart';
import 'package:task_app/presentation/auth_screen.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomAuthProvider>(
      create: (context) => CustomAuthProvider(injector<AuthUseCase>()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: const Text(
            "Task List",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await Provider.of<CustomAuthProvider>(context, listen: false)
                    .logOut()
                    .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const AuthScreen(),
                          ),
                        ));
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
