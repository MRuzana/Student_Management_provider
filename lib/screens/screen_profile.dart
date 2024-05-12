import 'package:flutter/material.dart';
import 'package:project3/db/model/student_model.dart';

class Profile extends StatelessWidget {
  final StudentModel studentModel;
   const Profile({super.key, required this.studentModel});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      
      appBar: AppBar(
        title: const Text('Profile',
        style: TextStyle(color:Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 126, 202, 128),

      ),

    body: SingleChildScrollView(
      
      child: SafeArea(
    
        
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
         
          children: [
        
             Padding(
                padding:  const EdgeInsets.all(8.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 70,
                    
                    backgroundImage: MemoryImage(studentModel.image!),
                  ),
                ),
              ),
          
             SizedBox(
              
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Name : ',
                  style:  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 202, 128),
                    
                  ),),
                  Text(studentModel.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 202, 128), 
                  ),),
              
                ],
              ),
            ),
             SizedBox(
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Age :',
                   style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 202, 128),
                  ),),
                  Text(studentModel.age,
                   style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 202, 128),
                  ),),
            
                ],
              ),
            ),
             SizedBox(
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text('Place : ',
                   style: TextStyle(
                    fontSize: 20,
                   fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 202, 128),
                    
                  ),
                  ),
            
                 Text(studentModel.place,
                   style: const TextStyle(
                    fontSize: 20,
                   fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 202, 128),
                    
                  ),
                  ),  
                ],
              ),
            ),
             SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Mobile : ',
                   style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 202, 128),
                    
                  ),
                  ),
            
                   Text(studentModel.mobile,
                   style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 202, 128),
                    
                  ),
                  ),
                ],
              ),
            ),
        
          ],
        ),
                  ),
      ),
    ),
    );
  }
}

