import 'package:app_spacex/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await DatabaseManager().init();
  runApp(const App());
}
