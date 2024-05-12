import 'package:flutter/material.dart';
import 'package:project3/db/functions/db_functions.dart';
import 'package:project3/db/model/student_model.dart';

class AddStudentProvider extends ChangeNotifier {
  void addStudentProvider(StudentModel student) {
    addstudent(student);
    notifyListeners();
  }
}
