import 'package:flutter/material.dart';
import 'package:islami_app/utils/my_theme_data.dart';

import 'home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.name:(context)=>HomeScreen(),
      },
      initialRoute: HomeScreen.name,
    );
  }
}
