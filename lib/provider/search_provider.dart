// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:project3/db/functions/db_functions.dart';
import 'package:project3/db/model/student_model.dart';

class SearchProvider extends ChangeNotifier {
  Future<List<StudentModel>> searchItemProvider(String searchText) async {
   
    studentList = await searchPersons(searchText);
    notifyListeners();
    return studentList;
  }
}

