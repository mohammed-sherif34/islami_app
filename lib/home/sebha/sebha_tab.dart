import 'package:flutter/material.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinningWheel();
  }
}

class SpinningWheel extends StatefulWidget {
  @override
  _SpinningWheelState createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double currentAngle = 0.0;
  int counter = 0;
  String tasbehPhrase = 'سبحان الله';
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void startSpinning() {
    if (counter == 32) {
      tasbehPhrase = 'الحمد لله';
    } else if (counter == 65) {
      tasbehPhrase = 'الله أكبر';
    } else if (counter == 98) {
      tasbehPhrase = 'سبحان الله';
      counter = 0;
    }
    setState(() {
      currentAngle += 0.3; // Rotate by 0.3 radians each time
    });
    animationController.forward(from: 0.0).then((_) {
      animationController.stop();
    });
    counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Row(
          //mainAxisAlignment: MainAxisAlignment.,
          children: [
            const Spacer(),
            const SizedBox(
              width: 40,
            ),
            Image.asset('assets/images/head_of_seb7a.png'),
            Spacer()
          ],
        ),
        AnimatedBuilder(
          animation: animationController,
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/body_of_seb7a.png",
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height / 3.3,
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
          'عدد التسبيحات ',
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
}

