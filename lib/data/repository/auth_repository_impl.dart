import '../../domain/entities/user.dart';
import '../datasource/auth_datasource.dart';
import '../../domain/respository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<void> signUp({required String email, required String password}) async {
    await _dataSource.signUp(email: email, password: password);
  }

  @override
  Future<void> logIn({required String email, required String password}) async {
    await _dataSource.logIn(email: email, password: password);
  }

  @override
  Future<void> logOut() async {
    await _dataSource.logOut();
  }

  @override
  Future<User?> getCurrentUser() async {
    return _dataSource.getCurrentUser();
  }
}
