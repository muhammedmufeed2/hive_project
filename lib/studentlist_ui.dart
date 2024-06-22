import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'crud_hive.dart';
import 'modelclass/model.dart';
import 'student_form_page.dart';

class StudentListPage extends StatefulWidget {
  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  final StudentService _studentService = StudentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentFormPage()),
            ).then((_) => setState(() {})),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Student>('students').listenable(),
        builder: (context, Box<Student> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No students added.'));
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              final student = box.getAt(index)!;
              return ListTile(
                title: Text(student.name),
                subtitle: Text('Age: ${student.age}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentFormPage(student: student, index: index),
                        ),
                      ).then((_) => setState(() {})),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _studentService.deleteStudent(index);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
