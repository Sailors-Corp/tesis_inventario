import 'package:inventory_tesis/features/auth/data/datasources/auth_data_sources.dart';
import 'package:inventory_tesis/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authDataSources);

  final AuthDataSources _authDataSources;

  @override
  Future checkLogin() {
    // TODO: implement checkLogin
    throw UnimplementedError();
  }

  @override
  Future<bool> authentication(String user, String password) async {
    return _authDataSources.authentication(user, password);
  }
}
