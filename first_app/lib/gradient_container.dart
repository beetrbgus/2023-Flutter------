import 'package:flutter/material.dart';

const Alignment topLeft = Alignment.topLeft;
const Alignment bottomRight = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  GradientContainer(
    this.color1,
    this.color2, {
    super.key,
  });
  GradientContainer.orange({super.key})
      : color1 = const Color.fromRGBO(255, 171, 64, 1),
        color2 = const Color.fromARGB(255, 235, 227, 217);
  final Color color1;
  final Color color2;

  var activeDiceImage = 'assets/images/dice-1.png';
  // 주사위 굴리면 나오는 행동을 정의
  void rollDice() {
    activeDiceImage = 'assets/images/dice-4.png';
    print("눌림!");
  }

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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDiceImage,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 30),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28),
              ),
              child: const Text('주사위 굴리기'),
            )
          ],
        ),
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
