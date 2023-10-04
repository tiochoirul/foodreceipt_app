import 'package:flutter/material.dart';
import 'package:foodreceipt_app/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Figtree',
      ),
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 700) {
            return const MainScreen(gridCount: 2);
          } else if (constraints.maxWidth <= 1200) {
            return const MainScreen(gridCount: 4);
          } else {
            return const MainScreen(gridCount: 8);
          }
        },
      ),
    );
  }
}
