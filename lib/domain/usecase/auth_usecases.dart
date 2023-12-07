import 'package:task_app/domain/entities/user.dart';

import '../respository/auth_repository.dart';

abstract class AuthUseCase {
  Future<void> signUp({required String email, required String password});
  Future<void> logIn({required String email, required String password});
  Future<void> logOut();
  Future<User?> getCurrentUser();
}

class AuthUseCaseImpl extends AuthUseCase {
  AuthRepository authUseCaseRepository;
  AuthUseCaseImpl(
    this.authUseCaseRepository,
  );

  @override
  Future<User?> getCurrentUser() {
    return authUseCaseRepository.getCurrentUser();
  }

  @override
  Future<void> logIn({required String email, required String password}) {
    return authUseCaseRepository.logIn(email: email, password: password);
  }

  @override
  Future<void> logOut() {
    return authUseCaseRepository.logOut();
  }

  @override
  Future<void> signUp({required String email, required String password}) {
    return authUseCaseRepository.signUp(email: email, password: password);
  }
}
