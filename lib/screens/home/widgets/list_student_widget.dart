import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_db_project/db/functions/db_functions.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (ctx, studentList, child) {
          log('list student widget');
          log(studentList.length.toString());
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              log(studentList.length.toString());
              log(data.name);
              return ListTile(
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: IconButton(
                    onPressed: () {
                      if (data.id != null) {
                        deleteStudent(data.id!);
                      } else {
                        print("Student ID is null. Unable to delete");
                      }
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    )),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: studentList.length,
          );
        });
  }
}
