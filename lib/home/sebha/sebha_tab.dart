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

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void startSpinning() {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            Image.asset('assets/images/head_of_seb7a.png'),
          ],
        ),
        AnimatedBuilder(
          animation: animationController,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
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
        SebhaBody(),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: startSpinning,
          child: Text(
            'سبحان الله',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}

class BottomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width,
        size.height - 50); // Adjust the height to crop from the bottom
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class SebhaBody extends StatelessWidget {
  const SebhaBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
            ' 30 ',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
