import 'package:flutter/material.dart';

// stateful 위젯은 두개의 클래스로 구성
class DiceRoller extends StatefulWidget {
  // stateful 위젯은 내부적으로 변화할 수 있지만 해당 클래스는 변화하지 않음.
  const DiceRoller({super.key});

  // 값을 가지는 것이 아니라 State를 반환
  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

// _ 로 private 접근자라는 것을 알려줌.
class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-1.png';

  // 주사위 굴리면 나오는 행동을 정의
  void rollDice() {
    // stateful 위젯에서 build를 다시 실행하라고 명령함.
    setState(() {
      activeDiceImage = 'assets/images/dice-4.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
