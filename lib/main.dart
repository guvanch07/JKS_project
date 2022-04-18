import 'package:flutter/material.dart';
import 'package:presentation/screen/app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initInjector();
  runApp(const App());
}
