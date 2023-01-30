import 'package:hossam_test_mvvm/core/error/exception.dart';
import 'package:hossam_test_mvvm/core/error/failure.dart';
import 'package:hossam_test_mvvm/features/data/data_sources/simple_remote_data_source.dart';
import 'package:hossam_test_mvvm/features/domain/entities/simple_model.dart';
import 'package:hossam_test_mvvm/features/domain/repositories/simple_repository.dart';
import 'package:dartz/dartz.dart';

class SimpleModelRepository implements SimpleRepository {
  final SimpleRemoteDataSourceImpl remoteDataSource;
  SimpleModelRepository(
      {required this.remoteDataSource,});
  @override
  Future<Either<Failure, List<SimpleData>>> getAllSimpleData() async {
    // if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getAllSimpleData());
      } on ServerException {
        return Left(ServerFailure());
      }
    // } else {
    //   return Left(OfflineFailure());
    // }
  }

  @override
  Future<Either<Failure, bool>> addSimpleData({required Map<String, Object?> data}) async {
    // if (await networkInfo.isConnected) {
    try {
      return Right(await remoteDataSource.addSimpleData(data: data));
    } on ServerException {
      return Left(ServerFailure());
    }
    // } else {
    //   return Left(OfflineFailure());
    // }
  }
}
