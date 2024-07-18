import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
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
        SuraDetailsScreen.name:(context)=>SuraDetailsScreen(),
         HadethDetailsScreen.name:(context)=>HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.name,
    );
  }
}
