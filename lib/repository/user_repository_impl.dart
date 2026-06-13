import '../datasource/remote/user_remote_datasource.dart';
import '../datasource/local/user_local_datasource.dart';

class UserRepositoryImpl {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<String> getUser() async {
    final user = await remoteDataSource.getUser();

    await localDataSource.saveUser(user);

    return user;
  }
}