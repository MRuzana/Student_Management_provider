

import 'dart:typed_data';

class StudentModel{
  final int? id;
  final String name;
  final String age;
  final String place;
  final String mobile;
  final Uint8List? image; 

  StudentModel({required this.name, required this.age, required this.place, required this.mobile, this.id,this.image});

 static StudentModel fromMap(Map<String, Object?>map){
  final id=map['id'] as int;
  final name=map['name'] as String;
  final age=map['age'] as String;
  final place=map['place'] as String;
  final mobile=map['mobile'] as String;
  final image = map['image'] as Uint8List?;

  return StudentModel(id:id, name: name, age: age, place: place, mobile: mobile,image: image);
 }

 
}