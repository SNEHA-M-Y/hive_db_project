import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_db_project/db/models/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  log('add student..');
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  final _id = await studentDB.add(value);
  value.id = _id;
  studentListNotifier.value.add(value);

  studentListNotifier.notifyListeners();
  // print(value.toString());
}

Future<void> getAllStudents() async {
  log('get student..');
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  await studentDB.delete(id);
  getAllStudents();
}
