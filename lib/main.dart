import 'package:flutter/material.dart';
import 'package:mx_test_project/firebase_options.dart';
import 'package:presentation/screen/app/app.dart';
import 'di/injector.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initInjector();
  runApp(const App());
}
