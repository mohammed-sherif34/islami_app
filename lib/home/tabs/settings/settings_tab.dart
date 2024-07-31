import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/tabs/settings/theme_drop_down.dart';

import 'language_drop_down.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text(AppLocalizations.of(context)!.theme),
          SizedBox(
            height: 10,
          ),
          ThemeSwitch(),
          Spacer(),
          Text(AppLocalizations.of(context)!.language),
          SizedBox(
            height: 10,
          ),
          LanguageDropDown(),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
