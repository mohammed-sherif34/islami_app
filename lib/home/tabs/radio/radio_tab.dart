import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/radio_image.png'),
        Text(
        AppLocalizations.of(context)!.holy_quran_radio,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageIcon(
              color: Theme.of(context).primaryColor,
              AssetImage(
                'assets/images/back_radio_icon.png',
              ),
            ),
            ImageIcon(
              color: Theme.of(context).primaryColor,
              AssetImage(
                'assets/images/play_radio_icon.png',
              ),
            ),
            ImageIcon(
              color: Theme.of(context).primaryColor,
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
