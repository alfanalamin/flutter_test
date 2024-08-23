import 'package:flutter/material.dart';
import 'package:flutter_technical_test/presentation/pages/home_empty.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          surface: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HomeEmpty(),
    );
  }
}
