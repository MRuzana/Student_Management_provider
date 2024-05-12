import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:project3/db/functions/db_functions.dart';
import 'package:project3/db/model/student_model.dart';


class EditProvider extends ChangeNotifier{
  StudentModel? studentModel;

  
  void editstudentProvider(int id,String name, String age ,String place ,String mobile,Uint8List image){
    editStudent(id, name, age, place, mobile, image);
    notifyListeners();
  }
}