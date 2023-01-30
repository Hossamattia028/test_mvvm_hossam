
import 'package:hossam_test_mvvm/core/config/sql/sql_table_names.dart';
import 'package:hossam_test_mvvm/core/config/sql/sqldb.dart';
import 'package:hossam_test_mvvm/features/data/models/simple_model.dart';


abstract class SimpleRemoteDataSource {
  Future<List<SimpleModel>> getAllSimpleData();
  Future<bool> addSimpleData({required Map<String, Object?> data});
}

class SimpleRemoteDataSourceImpl implements SimpleRemoteDataSource {
  final SqlDb sqlDb;
  SimpleRemoteDataSourceImpl({required this.sqlDb});
  @override
  Future<List<SimpleModel>> getAllSimpleData() async {
    final dataList = await sqlDb.readSqlData(SqlTableName.simpleTable);
    return dataList.map<SimpleModel>((categoryModel) {
          return SimpleModel.fromJson(categoryModel);
    }).toList();
  }

  @override
  Future<bool> addSimpleData({required Map<String, Object?> data}) async {
    final dataList = await sqlDb.insertSqlData(SqlTableName.simpleTable,data);
    return false;
  }
}
