// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testproject/Login.dart';
import 'package:testproject/profile.dart';

// ignore_for_file: prefer_const_constructors
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait(
      [rootBundle.load('assets/fonts/DancingScript-VariableFont_wght.ttf')]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bretts App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      //home: profile(),
    );
  }
}









/*class TestWidget extends StatelessWidget {
  const TestWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text("Hello world");
  }
}
*/
