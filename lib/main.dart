import 'package:flutter/material.dart';
import 'package:hive_db_project/db/models/data_model.dart';
import 'package:hive_db_project/screens/home/screen_home.dart';
import 'package:hive_flutter/adapters.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
//     Hive.registerAdapter(StudentModelAdapter());
//   }
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ScreenHome(),
//     ),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ScreenHome()));
}
