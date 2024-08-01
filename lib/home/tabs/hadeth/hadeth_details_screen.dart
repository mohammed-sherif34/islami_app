import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  const HadethDetailsScreen({super.key});
  static const String name = 'HadethDetailsScreen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  String hadethBody = '';
  List<String> hadethLines = [];
  hadethBodyCollect() {
    for (int i = 1; i < hadethLines.length; i++) {
      hadethBody += hadethLines[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    String hadeth = ModalRoute.of(context)?.settings.arguments as String;
    hadethLines = hadeth.split('\n');
    hadethBodyCollect();

    return Stack(
      children: [
        provider.isDark()
            ? Image.asset(
                'assets/images/dark_back_ground.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/app_back_ground.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: provider.isDark()
                  ? AppColors.white
                  : AppColors.black, // Change the color of the back arrow here
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: provider.isDark()
                  ? Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.white)
                  : Theme.of(context).textTheme.bodyLarge,
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
                      color: provider.isDark()
                          ? AppColors.primaryDarkColor
                          : AppColors.white2,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(hadethLines[0],
                              style: GoogleFonts.reemKufi(
                                textStyle: provider.isDark()
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppColors.yellow)
                                    : Theme.of(context).textTheme.bodyMedium,
                              )),
                          const SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 16, top: 8),
                        color: provider.isDark()
                            ? AppColors.yellow
                            : Theme.of(context).primaryColor,
                        width: double.infinity,
                        height: 1,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            hadethBody,
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.amiri(
                                textStyle: TextStyle(
                                    color: provider.isDark()
                                        ? AppColors.yellow
                                        : AppColors.black)),
                          ),
                        ),
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
