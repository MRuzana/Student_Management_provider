import 'dart:typed_data';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:project3/db/model/student_model.dart';
import 'package:project3/db/functions/db_functions.dart';
import 'package:project3/provider/delete_provider.dart';
import 'package:project3/provider/get_all_student_provider.dart';
import 'package:project3/screens/screen_add_details.dart';
import 'package:project3/widgets/no_student_widget.dart';
import 'package:project3/widgets/student_grid_widget.dart';
import 'package:project3/widgets/student_list_widget.dart';
import 'package:provider/provider.dart';


class ListDetails extends StatelessWidget {
  late final StudentModel studentModel;
  final ValueNotifier<bool> isGridViewNotifier = ValueNotifier(false);
  //List<StudentModel>searchResult = [];
  ListDetails({super.key});

  @override
  Widget build(BuildContext context) {
    //getAllStudents();
   Provider.of<GetAllStudentProvider>(context,listen: false).getStudentProvider();

    return Scaffold(
      appBar: EasySearchBar(
        actions: [
          IconButton(
              onPressed: () {
                isGridViewNotifier.value = !isGridViewNotifier.value;
               // getAllStudents();
               Provider.of<GetAllStudentProvider>(context,listen: false).getStudentProvider();
              },
              icon: const Icon(Icons.view_module))
        ],
        title: const Text(
          'Student list',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        onSearch: (value) async {

          List<StudentModel> searchResult = await Provider.of<GetAllStudentProvider>(context, listen: false).searchItemProvider(value);         
          studentList = searchResult;
          
        },
      ),
      
      body: SafeArea(
        child: Consumer<GetAllStudentProvider>(
         // valueListenable: studentlistNotifier,
          builder: (ctx, value,_) {
                  
            if (studentList.isEmpty) {
              return const NoStudent();
            } else {
              return isGridViewNotifier.value
                  ? StudentGridview(studentList: studentList)
                  : StudentListView(studentList: studentList);
            }
          },
        )
        

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddDetails()));
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

deleteAlert(BuildContext context, int id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Do you want to delete?'),
          actions: [
               Consumer<DeleteProvider>(
                builder: (context, value, child){
                  return TextButton(
                  onPressed: () {
                   // deleteStudent(id);
                  Provider.of<DeleteProvider>(context,listen: false).deleteItemProvider(context, id);
                  value.deleteItemProvider(context, id);
                    Navigator.of(context).pop();
                  },
                  child: const Text('YES'));
                },
                
               ),

            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('NO')),
          ],
        );
      });
}

editAlert(BuildContext context, int id, String name, String age, String place,
    String mobile, Uint8List image) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Do you want to edit?'),
          actions: [
            TextButton(
                onPressed: () {
                  editStudent(id, name, age, place, mobile, image);
                  Navigator.of(context).pop();
                },
                child: const Text('YES')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('NO')),
          ],
        );
      });
}
