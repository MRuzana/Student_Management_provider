import 'package:flutter/material.dart';
import 'package:project3/db/functions/db_functions.dart';
import 'package:project3/provider/add_list_provider.dart';
import 'package:project3/provider/delete_provider.dart';
import 'package:project3/provider/edit_list_provider.dart';
import 'package:project3/provider/get_all_student_provider.dart';
import 'package:project3/provider/image_provider.dart';
import 'package:project3/screens/screen_list_details.dart';
import 'package:provider/provider.dart';


Future <void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await openDb();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AddStudentProvider()),
        ChangeNotifierProvider(create: (context)=>PickImageProvider()),
        ChangeNotifierProvider(create: (context)=>EditProvider()),
        ChangeNotifierProvider(create: (context)=>DeleteProvider()),
        ChangeNotifierProvider(create: (context)=>GetAllStudentProvider()),
        //ChangeNotifierProvider(create: (context)=>SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 126, 202, 128)
        ),
        home:  ListDetails(),
      ),
    );  
  }
}




