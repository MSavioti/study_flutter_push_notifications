import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_push_notifications/app/app.dart';

void main() {
  Firebase.initializeApp();
  runApp(const App());
}
