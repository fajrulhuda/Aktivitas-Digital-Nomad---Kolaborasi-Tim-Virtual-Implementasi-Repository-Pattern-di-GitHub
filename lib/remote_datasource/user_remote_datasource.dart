abstract class UserRemoteDataSource {
  Future<String> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<String> getUser() async {
    // Simulasi data dari API
    return "Data User dari API";
  }
}