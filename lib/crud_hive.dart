import 'package:hive/hive.dart';

import 'modelclass/model.dart';

class StudentService {
  final Box<Student> _studentBox = Hive.box<Student>('students');

  List<Student> getAllStudents() {
    return _studentBox.values.toList();
  }

  void addStudent(Student student) {
    _studentBox.add(student);
  }

  void updateStudent(int index, Student student) {
    _studentBox.putAt(index, student);
  }

  void deleteStudent(int index) {
    _studentBox.deleteAt(index);
  }
}
