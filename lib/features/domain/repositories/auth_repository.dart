import 'package:dartz/dartz.dart';
import 'package:hossam_test_mvvm/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signIn({required String email,required String password});
  Future<Either<Failure, bool>> signOut();
}
