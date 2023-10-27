import 'package:adv_basic/start_screen.dart';
import 'package:flutter/widgets.dart';

const Alignment topLeft = Alignment.topLeft;
const Alignment bottomRight = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(
    this.color1,
    this.color2, {
    super.key,
  });

  final Color color1;
  final Color color2;

  const GradientContainer.orange({super.key})
      : color1 = const Color.fromARGB(255, 218, 152, 31),
        color2 = const Color.fromARGB(255, 238, 206, 168);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: topLeft,
          end: bottomRight,
        ),
      ),
      child: const StartScreen(),
    );
  }
}
