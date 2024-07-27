import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinningWheel();
  }
}

class SpinningWheel extends StatefulWidget {
  const SpinningWheel({super.key});

  @override
  _SpinningWheelState createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double currentAngle = 0.0;

  int counter = 0;
  String tasbehPhrase = '';
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tasbehPhrase = AppLocalizations.of(context)!.praise_God;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void startSpinning() {
    counter++;

    tasbehCheck(context);
    setState(() {
      currentAngle += 0.3; // Rotate by 0.3 radians each time
    });
    animationController.forward(from: 0.0).then((_) {
      animationController.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  // start: MediaQuery.of(context).size.width * .4
                  ),
              child: Image.asset('assets/images/Frame1.png'),
            ),
          ],
        ),
        AnimatedBuilder(
          animation: animationController,
          child: Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/body_of_seb7a.png",
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height / 3.6,
          ),
          builder: (BuildContext context, Widget? _widget) {
            return Transform.rotate(
              angle: currentAngle,
              child: _widget,
            );
          },
        ),
        Spacer(),
        Text(
          AppLocalizations.of(context)!.number_of_praises,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.only(top: 15, bottom: 20, right: 8, left: 12),
          child: Text(
            counter.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: startSpinning,
          child: Text(
            tasbehPhrase,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Spacer(
          flex: 2,
        )
      ],
    );
  }

  void tasbehCheck(BuildContext context) {
    if (counter == 33) {
      tasbehPhrase = AppLocalizations.of(context)!.thank_God;
    } else if (counter == 66) {
      tasbehPhrase = AppLocalizations.of(context)!.allah_is_the_greatest;
    } else if (counter == 99) {
      tasbehPhrase = AppLocalizations.of(context)!.praise_God;
      counter = 0;
    }
  }
}
