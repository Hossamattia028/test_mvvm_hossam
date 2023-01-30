

import 'package:hossam_test_mvvm/features/domain/entities/user_model.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.name,
      required super.email,
      });

  static UserModel fromJson(Map<String, dynamic> jsonObject) {
    return UserModel(
      id: jsonObject['id'],
      name: jsonObject['name'],
      email: jsonObject['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
