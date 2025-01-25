import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/radio/model/radio_model.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_config_provider.dart';
import '../../../utils/app_colors.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  List<Radios>? radioList;

  @override
  Widget build(BuildContext context) {
    //  var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          AppLocalizations.of(context)!.holy_quran_radio,
          style: GoogleFonts.elMessiri(
              textStyle: Theme.of(context).textTheme.bodyMedium),
        ),
        Image.asset('assets/images/radio_image.png'),
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: FutureBuilder<RadioModel?>(
            future: Provider.of<AppConfigProvider>(context, listen: false)
                .radioPlay(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,
                ));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return ListView.builder(
                    physics: const PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.radios!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: RadioNameItem(
                          radio: snapshot.data!.radios![index],
                        ),
                      );
                    });
              } else {
                return const Text('No data available');
              }
            },
          ),
        ),
      ],
    );
  }
}

class RadioNameItem extends StatelessWidget {
  const RadioNameItem({
    super.key,
    required this.radio,
  });
  final Radios radio;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          radio.name!,
          style: GoogleFonts.elMessiri(
              textStyle: Theme.of(context).textTheme.bodyMedium),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                provider.playAudio(radio.url!);
              },
              child: ImageIcon(
                color: provider.isDark()
                    ? AppColors.yellow
                    : Theme.of(context).primaryColor,
                const AssetImage(
                  'assets/images/play_radio_icon.png',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                provider.pauseAudio();
              },
              child: Icon(Icons.pause,
                  color: provider.isDark()
                      ? AppColors.yellow
                      : Theme.of(context).primaryColor,
                  size: 30),
            )
          ],
        ),
      ],
    );
  }
}
