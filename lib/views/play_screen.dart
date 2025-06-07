import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/game_controller.dart';
import 'dice_panel.dart';
import 'score_sheet.dart';

// Main game screen widget
class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameCtrl = Provider.of<GameController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yahtzee Game'),
        centerTitle: true,
      ),
      body: gameCtrl.isGameOver
          // Show game over dialog if game is finished
          ? Center(
              child: AlertDialog(
                title: const Text("Game Over"),
                content: Text("Final Score: ${gameCtrl.scoreSheet.total}"),
                actions: [
                  TextButton(
                    onPressed: () => gameCtrl.restartGame(),
                    child: const Text("Restart"),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const DicePanel(),
                Text("Rolls Remaining: ${gameCtrl.remainingRolls}",
                    style: const TextStyle(fontSize: 22)),
                ElevatedButton(
                  onPressed:
                      gameCtrl.remainingRolls > 0 ? gameCtrl.throwDice : null,
                  child: const Text("Throw Dice"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const ScoreSheet(),
                  ),
                ),
                Text("Total Score: ${gameCtrl.scoreSheet.total}",
                    style: const TextStyle(fontSize: 22)),
              ],
            ),
    );
  }
}
