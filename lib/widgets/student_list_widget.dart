import 'package:flutter/material.dart';
import 'package:project3/db/model/student_model.dart';
import 'package:project3/screens/edit_profile.dart';
import 'package:project3/screens/screen_list_details.dart';
import 'package:project3/screens/screen_profile.dart';

class StudentListView extends StatelessWidget {
  final List<StudentModel> studentList;
  const StudentListView({
    super.key,required this.studentList
  });

  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
        itemBuilder: (context, index) {
          final data = studentList[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Profile(
                        studentModel: studentList[index],
                      )));
            },
            leading: CircleAvatar(
              backgroundImage: MemoryImage(data.image!),
              radius: 30,
            ),
            title: Text(data.name),
            subtitle: Text(data.age),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditProfile(
                              studentModel: studentList[index],
                            )));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 126, 202, 128),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    deleteAlert(context, studentList[index].id!);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: studentList.length);
  }
}