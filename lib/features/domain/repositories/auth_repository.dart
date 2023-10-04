abstract class AuthRepository {
  Future<bool> authentication(String user, String password);

  Future checkLogin();
}
