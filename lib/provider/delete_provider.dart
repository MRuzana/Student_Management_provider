import 'package:flutter/material.dart';
import 'package:project3/db/functions/db_functions.dart';


class DeleteProvider extends ChangeNotifier{

  void deleteItemProvider(BuildContext context, int id){
    deleteStudent(context,id);
    notifyListeners();
  }
}