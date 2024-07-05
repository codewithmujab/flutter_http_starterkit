import 'package:flutter/material.dart';
//import 'package:flutter_pemula/screen/home.dart';
import 'package:flutter_pemula/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      // const Home(title: 'Tutorial Flutter Pemula'),
    );
  }
}
