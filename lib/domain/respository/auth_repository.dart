import 'package:task_app/domain/entities/user.dart';

abstract class AuthRepository {
  Future<void> signUp({required String email, required String password});
  Future<void> logIn({required String email, required String password});
  Future<void> logOut();
  Future<User?> getCurrentUser();
}
