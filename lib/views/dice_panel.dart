import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/game_controller.dart';

// Widget to display and interact with the dice.
class DicePanel extends StatelessWidget {
  const DicePanel({super.key});

  @override
  Widget build(BuildContext context) {
    final gameCtrl = Provider.of<GameController>(context);
    final diceObj = gameCtrl.diceInstance;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) {
        return GestureDetector(
          onTap: () => gameCtrl.toggleDiceHold(i),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.12,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: diceObj.isHeld(i) ? Colors.blue : Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                diceObj.values.isEmpty ? '' : diceObj.values[i].toString(),
                style: const TextStyle(fontSize: 26),
              ),
            ),
          ),
        );
      }),
    );
  }
}
