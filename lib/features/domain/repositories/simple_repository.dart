import 'package:dartz/dartz.dart';
import 'package:hossam_test_mvvm/core/error/failure.dart';
import 'package:hossam_test_mvvm/features/domain/entities/simple_model.dart';

abstract class SimpleRepository {
  Future<Either<Failure, List<SimpleData>>> getAllSimpleData();
  Future<Either<Failure, bool>> addSimpleData({required Map<String, Object?> data});
}
