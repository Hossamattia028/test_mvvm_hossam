import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hossam_test_mvvm/core/error/failure.dart';
import 'package:hossam_test_mvvm/features/domain/entities/simple_model.dart';
import 'package:hossam_test_mvvm/features/domain/use_cases/simple_data_usecase.dart';




final homeProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel();
});

class HomeViewModel extends ChangeNotifier{
  GetDataUseCase? getDataUseCase;
  AddDataUseCase? addDataUseCase;
  List<SimpleData>? list = [];



  bool isLoading = false;
  /// get list from sql
  Future getAllListFromSQL()async{
    try{
      isLoading = true;
      final res  = await getDataUseCase!();
      _mapFailureOrData(res);
      isLoading = false;
      notifyListeners();
    }catch(e){
      isLoading = false;
      debugPrint("getAllListFromSQL: ${e.toString()}");
    }
  }
  _mapFailureOrData(Either<Failure, List<SimpleData>> either) {
    return either.fold((failure) {
      /// handle error
    }, (data) {
      list = data;
    });
  }

  /// add list to sql
  Future<bool> addListToSql(SimpleData model)async{
    bool check = false;
    try{
      final res = await addDataUseCase!(data: {});
      _mapFailureOrAddData(res);
      notifyListeners();
    }catch(e){
      debugPrint("addListToSql:${e.toString()}");
    }
    return check;
  }

  _mapFailureOrAddData(Either<Failure, bool> either) {
    return either.fold((failure) {
      /// handle error
    }, (data) {
      if(data == false){}
    });
  }

}