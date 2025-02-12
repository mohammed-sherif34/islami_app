import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/quran/sura_data.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key, this.index = 1});
  static const String name = 'SuraDetailsScreen';
  final int index;

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> lines = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var suraData = ModalRoute.of(context)?.settings.arguments as SuraData;
    if (lines.isEmpty) {
      loudSuraa(suraData.index);
    }

    // Concatenate all text into a single string
    String concatenatedText = lines.asMap().entries.map((entry) {
      int index = entry.key;
      String text = entry.value;
      return '$text(${index + 1})';
    }).join(' ');

    return Stack(
      children: [
        provider.isDark()
            ? Image.asset(
                'assets/images/dark_back_ground.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/app_back_ground.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: provider.isDark()
                  ? AppColors.white
                  : AppColors.black, // Change the color of the back arrow here
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .03,
                      horizontal: MediaQuery.of(context).size.width * .05),
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .08,
                      left: MediaQuery.of(context).size.width * .08,
                      top: MediaQuery.of(context).size.height * .04,
                      bottom: MediaQuery.of(context).size.height * .1),
                  decoration: BoxDecoration(
                      color: provider.isDark()
                          ? AppColors.primaryDarkColor
                          : AppColors.white2,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('سورة ${suraData.suraName}',
                              style: GoogleFonts.reemKufi(
                                textStyle: provider.isDark()
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppColors.yellow)
                                    : Theme.of(context).textTheme.bodyMedium,
                              )),
                          const SizedBox(
                            width: 25,
                          ),
                          ImageIcon(
                            color: provider.isDark()
                                ? AppColors.yellow
                                : AppColors.black,
                            AssetImage(
                              'assets/images/sura_play_icon.png',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 24),
                        color: provider.isDark()
                            ? AppColors.yellow
                            : Theme.of(context).primaryColor,
                        width: double.infinity,
                        height: 1,
                      ),
                      lines.isEmpty
                          ? CircularProgressIndicator(
                              color: provider.isDark()
                                  ? AppColors.yellow
                                  : AppColors.primaryLightColor,
                            )
                          : Expanded(
                              child: SingleChildScrollView(
                                child: Text(
                                  concatenatedText,
                                  textDirection: TextDirection.rtl,
                                  style: GoogleFonts.amiri(
                                      textStyle: TextStyle(
                                          color: provider.isDark()
                                              ? AppColors.yellow
                                              : AppColors.black)),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future loudSuraa(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> virsesList = sura.split('\n');
    for (var i = 0; i < virsesList.length; i++) {
      print(virsesList[i]);
    }
    lines = virsesList;
    setState(() {});
  }
}
