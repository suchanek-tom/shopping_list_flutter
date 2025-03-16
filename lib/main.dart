import 'package:flutter/material.dart';
import 'package:shopping_list_suchanek_erasmus/screens/shopping_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping list app',
      theme:  ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purpleAccent,
          brightness: Brightness.light
        )
      ),
      home:   ShoppingListScreen(),
    );
  }
}
