// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, use_build_context_synchronously

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:project3/db/model/student_model.dart';
import 'package:project3/provider/get_all_student_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

//ValueNotifier<List<StudentModel>> studentlistNotifier = ValueNotifier([]);

List<StudentModel> studentList = [];
late Database _db;

Future<void> openDb() async {
  _db = await openDatabase(
    'student.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE student (id INTEGER PRIMARY KEY,name TEXT,age TEXT,place TEXT,mobile TEXT,image BLOB)');
    },
  );
}

Future<void> addstudent(StudentModel value) async {
  await _db.rawInsert(
      'INSERT INTO student (name,age,place,mobile,image) VALUES (?,?,?,?,?)',
      [value.name, value.age, value.place, value.mobile, value.image]);
  //await getAllStudents();
   GetAllStudentProvider();
   
  //studentlistNotifier.notifyListeners();
}

Future<List<StudentModel>> searchPersons(String searchText) async {
  final result = await _db
      .query('student', where: 'name LIKE ?', whereArgs: ['%$searchText%']);
  return result.map((e) {
    return StudentModel.fromMap(e);
  }).toList();
}

Future<List<StudentModel>> getAllStudents() async {
  final values = await _db.rawQuery('SELECT * FROM student');
  studentList.clear();
  for (var map in values) {
    final student = StudentModel.fromMap(map);
    studentList.add(student);
  }
  return studentList;
}

// Future<void> getAllStudents() async {
//   final values = await _db.rawQuery('SELECT * FROM student');
//   studentlistNotifier.value.clear();

//   for (var map in values) {
//     final student = StudentModel.fromMap(map);
//     studentlistNotifier.value.add(student);
//   }
//   studentlistNotifier.notifyListeners();
// }

Future<void> editStudent(int id, String name, String age, String place,
    String mobile, Uint8List image) async {
  await _db.rawUpdate(
      'UPDATE student SET name = ?, age = ? ,place = ?, mobile= ?,image =? WHERE id = ?',
      [name, age, place, mobile, image, id]);
    GetAllStudentProvider();
  //getAllStudents();
  //studentlistNotifier.notifyListeners();
}

Future<void> deleteStudent(BuildContext context, int id) async {
  await _db.rawDelete('DELETE FROM student WHERE id = ?', [id]);
  Provider.of<GetAllStudentProvider>(context,listen: false).getStudentProvider();
  //getAllStudents();
  // studentlistNotifier.notifyListeners();
}
