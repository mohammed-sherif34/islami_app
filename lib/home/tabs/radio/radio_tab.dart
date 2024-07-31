import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';
import '../../../utils/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/radio_image.png'),
        Text(
          AppLocalizations.of(context)!.holy_quran_radio,
          style: GoogleFonts.elMessiri(
              textStyle: Theme.of(context).textTheme.bodyMedium),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageIcon(
              color: provider.isDark()
                  ? AppColors.yellow
                  : Theme.of(context).primaryColor,
              AssetImage(
                'assets/images/back_radio_icon.png',
              ),
            ),
            ImageIcon(
              color: provider.isDark()
                  ? AppColors.yellow
                  : Theme.of(context).primaryColor,
              AssetImage(
                'assets/images/play_radio_icon.png',
              ),
            ),
            ImageIcon(
              color: provider.isDark()
                  ? AppColors.yellow
                  : Theme.of(context).primaryColor,
              AssetImage(
                'assets/images/next_radio_icon.png',
              ),
            ),
          ],
        )
      ],
    );
  }
}
