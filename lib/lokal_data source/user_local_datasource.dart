fakhrul :
abstract class UserLocalDataSource {
  Future<void> saveUser(String user);
  Future<String> getCachedUser();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  String _cachedUser = "";

  @override
  Future<void> saveUser(String user) async {
    _cachedUser = user;
  }

  @override
  Future<String> getCachedUser() async {
    return _cachedUser;
  }
}