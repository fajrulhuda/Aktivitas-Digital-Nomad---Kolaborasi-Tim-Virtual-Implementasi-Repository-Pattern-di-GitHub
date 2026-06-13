import 'package:flutter/material.dart';

import 'remote_datasource/user_remote_datasource.dart';
import 'lokal_data_source/user_local_datasource.dart';
import 'repository/user_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final repository = UserRepositoryImpl(
    remoteDataSource: UserRemoteDataSourceImpl(),
    localDataSource: UserLocalDataSourceImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repository Pattern'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: repository.getUser(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            return Text(snapshot.data!);
          },
        ),
      ),
    );
  }
}