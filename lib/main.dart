import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/utils/my_theme_data.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.name: (context) => const HomeScreen(),
        SuraDetailsScreen.name: (context) => const SuraDetailsScreen(),
        HadethDetailsScreen.name: (context) => const HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.name,
    );
  }
}
