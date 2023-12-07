// presentation/auth_provider.dart

import 'package:flutter/material.dart';
import 'package:task_app/domain/entities/user.dart';
import 'package:task_app/domain/usecase/auth_usecases.dart';


class CustomAuthProvider extends ChangeNotifier {
  final AuthUseCase _authUseCase;

  CustomAuthProvider(this._authUseCase);

  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<void> signUp({required String email, required String password}) async {
    await _authUseCase.signUp(email: email, password: password);
    _currentUser = await _authUseCase.getCurrentUser();
    notifyListeners();
  }

  Future<void> logIn({required String email, required String password}) async {
    await _authUseCase.logIn(email: email, password: password);
    _currentUser =await _authUseCase.getCurrentUser();
    notifyListeners();
  }

  Future<void> logOut() async {
    await _authUseCase.logOut();
    _currentUser = null;
    notifyListeners();
  }
}
