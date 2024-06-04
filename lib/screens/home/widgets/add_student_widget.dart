import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_db_project/db/functions/db_functions.dart';
import 'package:hive_db_project/db/models/data_model.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Age",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 180,
            child: ElevatedButton.icon(
              onPressed: () {
                onAddStudentButtonClicked();
                log('button');
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              label: Text(
                "Add Student",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _nameController.text; //.trim();
    final _age = _ageController.text; //.trim();
    if (_name.isEmpty || _age.isEmpty) {
      log('empty');
      return;
    }
    // print("$_name $_age");
    else {
      log('function');
      print('$_name $_age');
      final _student = StudentModel(name: _name, age: _age);

      log(_student.name, name: '_student.name');
      log(_student.age, name: '_student.age');
      addStudent(_student);
    }
  }
}
