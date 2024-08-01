import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/quran/quran_data.dart';
import 'package:islami_app/home/tabs/quran/sura_data.dart';
import 'package:islami_app/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Image.asset('assets/images/quran_image.png'),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: provider.isDark()
              ? AppColors.yellow
              : AppColors.primaryLightColor,
          height: 3,
        ),
        IntrinsicHeight(
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.ayat_num,
                      style: GoogleFonts.elMessiri(
                          textStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: provider.isDark()
                    ? AppColors.yellow
                    : AppColors.primaryLightColor,
                thickness: 2,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.sura_name,
                      style: GoogleFonts.elMessiri(
                          textStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: provider.isDark()
              ? AppColors.yellow
              : AppColors.primaryLightColor,
          height: 3,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: suraList.length,
              itemBuilder: (_, index) {
                return SuraNameAndNumberOfVerses(
                  suraData:
                      SuraData(index, suraList[index], suraVersesNum[index]),
                );
              }),
        )
      ],
    );
  }
}

class SuraNameAndNumberOfVerses extends StatelessWidget {
  final SuraData suraData;
  const SuraNameAndNumberOfVerses({super.key, required this.suraData});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.name,
            arguments: suraData);
      },
      child: IntrinsicHeight(
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    suraData.numberOfVerses,
                    style: GoogleFonts.reemKufi(
                        textStyle: Theme.of(context).textTheme.bodySmall),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: provider.isDark()
                  ? AppColors.yellow
                  : AppColors.primaryLightColor,
              thickness: 2,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      suraData.suraName,
                      style: GoogleFonts.reemKufi(
                          textStyle: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
