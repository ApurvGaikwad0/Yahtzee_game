import 'package:flutter/material.dart';
import '../models/dice.dart';
import '../models/scorecard.dart';

class GameController with ChangeNotifier {
  Dice diceInstance = Dice(5);
  ScoreCard scoreSheet = ScoreCard();
  int remainingRolls = 3;
  bool isGameOver = false;

  void throwDice() {
    if (remainingRolls > 0 && !isGameOver) {
      diceInstance.roll();
      remainingRolls--;
      notifyListeners();
    }
  }

  void toggleDiceHold(int index) {
    diceInstance.toggleHold(index);
    notifyListeners();
  }

  void chooseCategory(ScoreCategory category) {
    if (remainingRolls < 3) {
      try {
        scoreSheet.registerScore(category, diceInstance.values);
        _newTurn();
        if (scoreSheet.completed) {
          _finishGame();
        }
        notifyListeners();
      } catch (e) {}
    }
  }

  void _newTurn() {
    diceInstance.clear();
    remainingRolls = 3;
  }

  void _finishGame() {
    isGameOver = true;
    notifyListeners();
  }

  void restartGame() {
    diceInstance = Dice(5);
    scoreSheet = ScoreCard();
    remainingRolls = 3;
    isGameOver = false;
    notifyListeners();
  }
}
