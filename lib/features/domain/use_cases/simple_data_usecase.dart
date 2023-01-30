

import 'package:dartz/dartz.dart';
import 'package:hossam_test_mvvm/core/error/failure.dart';
import 'package:hossam_test_mvvm/features/domain/entities/simple_model.dart';
import 'package:hossam_test_mvvm/features/domain/repositories/simple_repository.dart';

class GetDataUseCase {
  final SimpleRepository repository;

  GetDataUseCase(this.repository);

  Future<Either<Failure, List<SimpleData>>> call() async {
    return await repository.getAllSimpleData();
  }
}


class AddDataUseCase {
  final SimpleRepository repository;

  AddDataUseCase(this.repository);

  Future<Either<Failure, bool>> call({required Map<String, Object?> data}) async {
    return await repository.addSimpleData(data: data);
  }
}
