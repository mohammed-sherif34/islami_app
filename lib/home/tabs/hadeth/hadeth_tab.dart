import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/utils/app_colors.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
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
              'الأحاديث',
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
              itemCount: 15,
              itemBuilder: (_, index) {
                return HadethItem(
                  hadethnum: index,
                );
              }),
        )
      ],
    );
  }
}

class HadethItem extends StatelessWidget {
  const HadethItem({super.key, required this.hadethnum});
  final int hadethnum;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          Navigator.pushNamed(context, HadethDetailsScreen.name);
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
