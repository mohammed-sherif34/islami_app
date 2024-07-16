import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/quran/quran_tab.dart';
import 'package:islami_app/home/radio/radio_tab.dart';
import 'package:islami_app/home/sebha/sebha_tab.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/my_theme_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelectidIndex = 0;
  List<Widget> tabs = [RadioTab(), SebhaTab(), HadethTab(), QuranTab()];

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
              'إسلامي',
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
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    size: 40,
                    AssetImage(
                      'assets/images/radio_icon.png',
                    ),
                  ),
                  label: 'راديو',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    size: 40,
                    AssetImage(
                      'assets/images/sebha_icon.png',
                    ),
                  ),
                  label: 'سبحا',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    size: 40,
                    AssetImage(
                      'assets/images/hadeth_icon.png',
                    ),
                  ),
                  label: 'حديث',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    size: 40,
                    AssetImage(
                      'assets/images/quran_icon.png',
                    ),
                  ),
                  label: 'قرءان',
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
