import 'package:flutter/material.dart';
import 'package:mainfreight/home.dart';
import 'package:mainfreight/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  var login= prefs.getBool('login');
  print(login);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink[200]),
      home:
        login==true?
      Home():SignIn(),
    ),
  );
}