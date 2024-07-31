import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';
import '../../../utils/app_colors.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(),
              color: provider.isDark()
                  ? AppColors.yellow
                  : AppColors.primaryLightColor,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DropdownMenu(dropdownMenuEntries: [
                    'English',
                    'العربية',
                  ]),
                ),
              ],
            ),
          ),
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
      dropdownColor:
          provider.isDark() ? AppColors.yellow : AppColors.primaryLightColor,
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
        color:
            provider.isDark() ? AppColors.yellow : AppColors.primaryLightColor,
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
