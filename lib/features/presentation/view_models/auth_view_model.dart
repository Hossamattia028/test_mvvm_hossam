import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hossam_test_mvvm/core/error/failure.dart';
import 'package:hossam_test_mvvm/features/domain/entities/simple_model.dart';
import 'package:hossam_test_mvvm/features/domain/use_cases/auth_data_usecase.dart';




final authProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends ChangeNotifier{
  SignInUseCase? signInUseCase;
  SignOutUseCase? signOutUseCase;

  bool isLoading = false;
  /// get list from sql
  Future singIn({required String email,required String password})async{
    try{
      isLoading = true;
      final res  = await signInUseCase!(email:email,password: password );
      _mapFailureOrSignIn(res);
      isLoading = false;
      notifyListeners();
    }catch(e){
      isLoading = false;
      debugPrint("singIn: ${e.toString()}");
    }
  }
  _mapFailureOrSignIn(Either<Failure, bool> either) {
    return either.fold((failure) {
      /// handle error
    }, (data) {
      /// handle after successfully signIn
    });
  }

  /// add list to sql
  Future<bool> signOut(SimpleData model)async{
    bool check = false;
    try{
      final res = await signOutUseCase!();
      _mapFailureOrSignOut(res);
      notifyListeners();
    }catch(e){
      debugPrint("signOut:${e.toString()}");
    }
    return check;
  }

  _mapFailureOrSignOut(Either<Failure, bool> either) {
    return either.fold((failure) {
      /// handle error
    }, (data) {
      if(data == false){}
    });
  }

}