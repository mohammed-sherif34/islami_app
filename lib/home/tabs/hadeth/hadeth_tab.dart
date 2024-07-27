import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<String> hadethContent = [];

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    loudHadethFile();
    return Column(
      children: [
        Image.asset('assets/images/ahadeth_image.png'),
        Container(
          color: AppColors.primaryLightColor,
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             AppLocalizations.of(context)!.alahadeth,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Container(
          color: AppColors.primaryLightColor,
          height: 3,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (_, index) {
                return HadethItem(
                  hadethnum: index,
                );
              }),
        ),
      ],
    );
  }

  Future loudHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    hadethContent = content.split('#\r\n');
    //List<String> hadeth=
  }
}

class HadethItem extends StatelessWidget {
  HadethItem({super.key, required this.hadethnum});
  final int hadethnum;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.name,
            arguments: hadethContent[hadethnum]);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'الحديث رقم ${hadethnum + 1}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
