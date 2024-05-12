// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:project3/db/model/student_model.dart';
import 'package:project3/provider/edit_list_provider.dart';
import 'package:project3/provider/image_provider.dart';
import 'package:project3/screens/screen_list_details.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  final StudentModel studentModel;
  EditProfile({super.key, required this.studentModel});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _placeController = TextEditingController();
  final _phController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {

    _nameController.text = studentModel.name;
    _ageController.text = studentModel.age;
    _placeController.text = studentModel.place;
    _phController.text = studentModel.mobile;
    _image=studentModel.image;
    int id = studentModel.id!;

    return Scaffold(
      //resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text(
          'Edit details',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 126, 202, 128),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        IconButton(onPressed: ()async{
                          Uint8List? imageBytes = await Provider.of<PickImageProvider>(context,listen: false).addImage();            

                        if(imageBytes!=null){                         
                          _image = imageBytes;
                         
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No image selected')),);
                        }  
                        },
                         icon:const  Icon(Icons.add_a_photo,color: Color.fromARGB(255, 126, 202, 128),)),
                      
                          Consumer<PickImageProvider>(
                            builder: (context, imageprovider, child) {
                              return CircleAvatar(
                            radius: 80,
                            backgroundImage: _image != null
                            ? MemoryImage(_image!) as ImageProvider // Convert Uint8List to ImageProvider
                            : const NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'), // Placeholder or default image
                            );
                            },
                            
                          ),

                       ],
                     ),
                   ),

                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 126, 202, 128))),
                        hintText: 'name',
                        hintStyle:  TextStyle(
                            color: Color.fromARGB(255, 126, 202, 128))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name should not be empty';
                      } 
                      else if(!RegExp(r"^[a-zA-Z'-\s]+$").hasMatch(value)){
                          return 'Enter valid name ';
                        }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 126, 202, 128))),
                        hintText: 'Age',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 126, 202, 128))),
                    validator: (value) {
                      //print('null');
                      if (value == null || value.isEmpty) {
                        return 'Age should not be empty';
                      }
                      else if(!RegExp(r'^[0-9]+$').hasMatch(value)){
                        return 'Enter valid age';

                      }
                       else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: _placeController,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 126, 202, 128))),
                        hintText: 'place',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 126, 202, 128))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'place should not be empty';
                      }
                      else if(!RegExp(r"^[a-zA-Z'-\s]+$").hasMatch(value)){
                          return 'Enter valid place ';
                        }
                       else {
                        return null;
                      }
                    },
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _phController,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 126, 202, 128))),
                        hintText: 'Mobile number',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 126, 202, 128))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile number should not be empty';
                      } else if (!RegExp(r"^(?:\+91)?[0-9]{10}$")
                          .hasMatch(value)) {
                        return 'enter valid mobile number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          onEdit(context, id);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 126, 202, 128),
                      ),
                      child: const Text(
                        'UPDATE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onEdit(BuildContext context, int id) async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final place = _placeController.text.trim();
    final mobile = _phController.text.trim();

    if (name.isEmpty || age.isEmpty || place.isEmpty || mobile.isEmpty||_image==null) {
      return;
    }

   StudentModel(name: name, age: age, mobile: mobile, place: place, id: id,image: _image);
   final editStudentProvider = Provider.of<EditProvider>(context,listen: false);
    editStudentProvider.editstudentProvider(id, name, age, place, mobile, _image!);
    
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ListDetails()));
  }
}

// class EditProfile extends StatefulWidget {
//   final StudentModel studentModel;
//   const EditProfile({super.key, required this.studentModel});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _placeController = TextEditingController();
//   final _phController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   Uint8List? _image;

  
//   @override
//   void initState() {
//     _nameController.text = widget.studentModel.name;
//     _ageController.text = widget.studentModel.age;
//     _placeController.text = widget.studentModel.place;
//     _phController.text = widget.studentModel.mobile;
//     _image=widget.studentModel.image;
  
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     int id = widget.studentModel.id!;
//     return Scaffold(
//       //resizeToAvoidBottomInset : false,
//       appBar: AppBar(
//         title: const Text(
//           'Edit details',
//           style: TextStyle(color: Colors.white),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: const Color.fromARGB(255, 126, 202, 128),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SafeArea(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                         IconButton(onPressed: ()async{
//                            Uint8List? imageBytes = await pickImage(ImageSource.gallery);
//                           if (imageBytes != null) {
//                             setState(() {
//                               _image = imageBytes;
//                             });
//                           }
//                         },
//                          icon:const  Icon(Icons.add_a_photo,color: Color.fromARGB(255, 126, 202, 128),)),
                      
//                            CircleAvatar(
//                           radius: 80,
//                           backgroundImage: _image != null
//                           ? MemoryImage(_image!) as ImageProvider // Convert Uint8List to ImageProvider
//                           : const NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'), // Placeholder or default image
//                         ),

//                        ],
//                      ),
//                    ),

//                   TextFormField(
//                     controller: _nameController,
//                     keyboardType: TextInputType.name,
//                     decoration: const InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 126, 202, 128))),
//                         hintText: 'name',
//                         hintStyle:  TextStyle(
//                             color: Color.fromARGB(255, 126, 202, 128))),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Name should not be empty';
//                       } 
//                       else if(!RegExp(r"^[a-zA-Z'-\s]+$").hasMatch(value)){
//                           return 'Enter valid name ';
//                         }
//                       else {
//                         return null;
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: _ageController,
//                     decoration: const InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 126, 202, 128))),
//                         hintText: 'Age',
//                         hintStyle: TextStyle(
//                             color: Color.fromARGB(255, 126, 202, 128))),
//                     validator: (value) {
//                       //print('null');
//                       if (value == null || value.isEmpty) {
//                         return 'Age should not be empty';
//                       }
//                       else if(!RegExp(r'^[0-9]+$').hasMatch(value)){
//                         return 'Enter valid age';

//                       }
//                        else {
//                         return null;
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.streetAddress,
//                     controller: _placeController,
//                     decoration: const InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 126, 202, 128))),
//                         hintText: 'place',
//                         hintStyle: TextStyle(
//                             color: Color.fromARGB(255, 126, 202, 128))),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'place should not be empty';
//                       }
//                       else if(!RegExp(r"^[a-zA-Z'-\s]+$").hasMatch(value)){
//                           return 'Enter valid place ';
//                         }
//                        else {
//                         return null;
//                       }
//                     },
//                   ),

//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.phone,
//                     controller: _phController,
//                     decoration: const InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 126, 202, 128))),
//                         hintText: 'Mobile number',
//                         hintStyle: TextStyle(
//                             color: Color.fromARGB(255, 126, 202, 128))),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Mobile number should not be empty';
//                       } else if (!RegExp(r"^(?:\+91)?[0-9]{10}$")
//                           .hasMatch(value)) {
//                         return 'enter valid mobile number';
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),

//                   ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           onEdit(context, id);
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             const Color.fromARGB(255, 126, 202, 128),
//                       ),
//                       child: const Text(
//                         'UPDATE',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> onEdit(BuildContext context, int id) async {
//     final name = _nameController.text.trim();
//     final age = _ageController.text.trim();
//     final place = _placeController.text.trim();
//     final mobile = _phController.text.trim();

//     if (name.isEmpty || age.isEmpty || place.isEmpty || mobile.isEmpty||_image==null) {
//       return;
//     }

//    StudentModel(name: name, age: age, mobile: mobile, place: place, id: id,image: _image);
//     editStudent(id, name, age, place, mobile, _image!);
    
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => ListDetails()));
//   }

// }
