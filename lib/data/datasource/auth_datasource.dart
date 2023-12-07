import 'package:task_app/domain/entities/user.dart' as user;
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<void> signUp({required String email, required String password});
  Future<void> logIn({required String email, required String password});
  Future<void> logOut();
  user.User? getCurrentUser();
}




class FirebaseAuthDataSource implements AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error during sign up: $e');
    }
  }

  @override
  Future<void> logIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error during login: $e');
    }
  }

  @override
  Future<void> logOut() async {
    await _auth.signOut();
  }

  @override
  user.User? getCurrentUser() {
    final currentUser = _auth.currentUser;
    return currentUser != null ? user.User(email: currentUser.email!) : null;
  }
}

