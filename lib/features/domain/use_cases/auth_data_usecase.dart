

import 'package:dartz/dartz.dart';
import 'package:hossam_test_mvvm/core/error/failure.dart';
import 'package:hossam_test_mvvm/features/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, bool>> call({required String email,required String password}) async {
    return await repository.signIn(email: email, password: password);
  }
}

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.signOut();
  }
}