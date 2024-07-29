import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownMenu(dropdownMenuEntries: [
                'English',
                'العربية',
              ]),
            ),
          ],
        ),
      ],
    );
  }
}

class DropdownMenu extends StatefulWidget {
  final List<String> dropdownMenuEntries;

  const DropdownMenu({super.key, required this.dropdownMenuEntries});

  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(15),
      value: dropdownValue.isNotEmpty
          ? dropdownValue
          : widget.dropdownMenuEntries.first,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 0,
      style: TextStyle(fontSize: 25, color: Colors.black),
      underline: Container(
        height: 2,
        color: AppColors.primaryLightColor,
      ),
      onChanged: (String? newValue) {
        newValue == 'English'
            ? provider.changeLanguage('en')
            : provider.changeLanguage('ar');
        setState(() {});
        dropdownValue = newValue!;
      },
      items: widget.dropdownMenuEntries
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
