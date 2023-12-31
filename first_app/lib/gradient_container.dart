import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const Alignment topLeft = Alignment.topLeft;
const Alignment bottomRight = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(
    this.color1,
    this.color2, {
    super.key,
  });
  const GradientContainer.orange({super.key})
      : color1 = const Color.fromRGBO(255, 171, 64, 1),
        color2 = const Color.fromARGB(255, 235, 227, 217);
  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: topLeft,
          end: bottomRight,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}

// class GradientContainer extends StatelessWidget {
//   const GradientContainer({
//     super.key,
//     required this.gradationColor,
//   });
//   final List<Color> gradationColor;
//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gradationColor,
//           begin: topLeft,
//           end: bottomRight,
//         ),
//       ),
//       child: const Center(
//         child: StyledText("Hello World--!!"),
//       ),
//     );
//   }
// }