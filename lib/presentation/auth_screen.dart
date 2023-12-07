import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_app/domain/usecase/auth_usecases.dart';
import 'package:task_app/injector.dart';
import 'package:task_app/presentation/auth_provider.dart';
import 'package:task_app/presentation/task_list.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomAuthProvider(injector<AuthUseCase>()),
      builder:(context,widget)=> Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Firebase Auth Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await Provider.of<CustomAuthProvider>(context, listen: false)
                      .signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                child: const Text('Sign Up'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await Provider.of<CustomAuthProvider>(context, listen: false)
                      .logIn(
                        email: emailController.text,
                        password: passwordController.text,
                      )
                      .then((value) => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const TaskList())));
                },
                child: const Text('Log In'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await Provider.of<CustomAuthProvider>(context, listen: false)
                      .logOut();
                },
                child: const Text('Log Out'),
              ),
              const SizedBox(height: 20),
              // Consumer<CustomAuthProvider>(
              //     builder: (context, authProvider, _) => Text(
              //           'Current User: ${authProvider.currentUser?.email ?? 'None'}',
              //           style: const TextStyle(fontSize: 16),
              //         )),`
            ],
          ),
        ),
      ),
    );
  }
}
