import 'package:hive/hive.dart';
part 'model.g.dart';


@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  Student({required this.name, required this.age});
}
