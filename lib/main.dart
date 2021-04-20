import 'package:clt/pages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData.from(colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColorDark: Color.fromRGBO(0, 72, 99, 1.0),
      backgroundColor: Color.fromRGBO(0, 72, 99, 1.0),
      cardColor: Color(0xFF203647),
      accentColor: Color(0xFF4da8da),

    )),
    home: Welcome()
  ));
}