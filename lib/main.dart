import 'package:conversor/view/home.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 121, 255, 87)),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 121, 255, 87),
      )
      ), 
      home: HomeView(),
   
    );
  }
}
