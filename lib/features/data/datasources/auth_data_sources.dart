abstract class AuthDataSources {
  bool authentication(String user, String password);
}

class AuthDataSourcesImpl extends AuthDataSources {
  @override
  bool authentication(String user, String password) {

    const String defaultUser = "Admin";
    const String defaultPassword = "Admin";

    return (user == defaultUser && password == defaultPassword);
  }
}
