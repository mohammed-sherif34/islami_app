import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});
  static const String name = 'SuraDetailsScreen';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/app_back_ground.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'إسلامي',
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
                      color: AppColors.white2,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سورة البقرة',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          ImageIcon(
                            color: AppColors.black,
                            AssetImage(
                              'assets/images/sura_play_icon.png',
                            ),
                          ),
                          //assets\images\sura_play_icon.png
                        ],
                      ),
                      Container(
                        color: Theme.of(context).primaryColor,
                        width: double.infinity,
                        height: 1,
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
}
