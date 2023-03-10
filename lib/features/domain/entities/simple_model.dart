import 'package:equatable/equatable.dart';

class SimpleData extends Equatable {
  final int id;
  final String title;

  const SimpleData(
      {required this.id,
      required this.title,
      });

  @override
  List<Object?> get props => [id, title];
}
