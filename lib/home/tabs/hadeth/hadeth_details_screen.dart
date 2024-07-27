import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    String hadeth = ModalRoute.of(context)?.settings.arguments as String;
    hadethLines = hadeth.split('\n');
    hadethBodyCollect();

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
            AppLocalizations.of(context)!.app_title,
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
                            hadethLines[0],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 16, top: 8),
                        color: Theme.of(context).primaryColor,
                        width: double.infinity,
                        height: 1,
                      ),Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                                    hadethBody,
                                    textDirection: TextDirection.rtl,
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
