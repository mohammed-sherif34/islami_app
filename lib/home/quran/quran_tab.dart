import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/quran_data.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
import 'package:islami_app/utils/app_colors.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/quran_image.png'),
        const SizedBox(
          height: 10,
        ),
        Container(
          color: AppColors.primaryLightColor,
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
                      'عدد الآيات',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: AppColors.primaryLightColor,
                thickness: 2,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'اسم السورة',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.primaryLightColor,
          height: 3,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: suraList.length,
              itemBuilder: (_, index) {
                return SuraNameAndNumberOfVerses(
                  numberOfVerses: suraVerses[index],
                  suraName: suraList[index],
                );
              }),
        )
      ],
    );
  }
}

class SuraNameAndNumberOfVerses extends StatelessWidget {
  final String suraName;
  final String numberOfVerses;
  const SuraNameAndNumberOfVerses(
      {super.key, required this.suraName, required this.numberOfVerses});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.name);
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
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      numberOfVerses,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: AppColors.primaryLightColor,
              thickness: 2,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    suraName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
