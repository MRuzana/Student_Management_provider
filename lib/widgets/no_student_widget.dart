import 'package:flutter/material.dart';

class NoStudent extends StatelessWidget {
  const NoStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 126, 202, 128),
            ),
            width: double.infinity,
            height: 50,
            child: const Center(
                child: Text(
              'No student',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ))),
      ),
    );
  }
}
