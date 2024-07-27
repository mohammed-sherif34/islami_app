import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelectidIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/app_back_ground.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: isSelectidIndex,
              onTap: (index) {
                isSelectidIndex = index;
                setState(() {});
              },
              selectedItemColor: AppColors.black,
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    size: 40,
                    AssetImage(
                      'assets/images/quran_icon.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    size: 40,
                    AssetImage(
                      'assets/images/hadeth_icon.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    size: 40,
                    AssetImage(
                      'assets/images/sebha_icon.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.sebha,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    size: 40,
                    AssetImage(
                      'assets/images/radio_icon.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.radio,
                ),
              ],
              backgroundColor: AppColors.primaryLightColor,
            ),
          ),
          body: tabs[isSelectidIndex],
        ),
      ],
    );
  }
}
