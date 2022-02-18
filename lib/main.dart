import 'package:app_spacex/app/app.dart';
import 'package:app_spacex/core/manager/database_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager().init();
  runApp(const App());
}
