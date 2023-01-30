

import 'package:hossam_test_mvvm/features/domain/entities/simple_model.dart';

class SimpleModel extends SimpleData {
  const SimpleModel(
      {required super.id,
      required super.title});

  static SimpleModel fromJson(Map<String, dynamic> jsonObject) {
    return SimpleModel(
      id: jsonObject['id'],
      title: jsonObject['title'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }
}
