import 'package:hossam_test_mvvm/core/error/exception.dart';
import 'package:hossam_test_mvvm/core/error/failure.dart';
import 'package:hossam_test_mvvm/features/data/data_sources/auth_remote_data_source.dart';
import 'package:hossam_test_mvvm/features/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthModelRepository implements AuthRepository {
  final AuthRemoteDataSourceImpl remoteDataSource;
  AuthModelRepository(
      {required this.remoteDataSource,});
  @override
  Future<Either<Failure, bool>> signIn({required String email,required String password}) async {
    // if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.signIn(email: email, password: password));
      } on ServerException {
        return Left(ServerFailure());
      }
    // } else {
    //   return Left(OfflineFailure());
    // }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    // if (await networkInfo.isConnected) {
    try {
      return Right(await remoteDataSource.signOut());
    } on ServerException {
      return Left(ServerFailure());
    }
    // } else {
    //   return Left(OfflineFailure());
    // }
  }
}
