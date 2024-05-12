import 'package:flutter/material.dart';
import 'package:project3/db/functions/db_functions.dart';
import 'package:project3/db/model/student_model.dart';

class GetAllStudentProvider extends ChangeNotifier {
  // ignore: unused_field
 // List<StudentModel> _studentList = [];
  Future<void> getStudentProvider() async{
 
    studentList = await getAllStudents();
    notifyListeners();
    
  }

  Future<List<StudentModel>> searchItemProvider(String searchText) async {
    
    studentList = await searchPersons(searchText);
    notifyListeners();
    return studentList;
  }

}
