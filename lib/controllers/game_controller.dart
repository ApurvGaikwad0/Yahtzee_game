import 'package:flutter/material.dart';
import '../models/dice.dart';
import '../models/scorecard.dart';

class GameController with ChangeNotifier {
  Dice diceInstance = Dice(5); // Holds dice state
  ScoreCard scoreSheet = ScoreCard(); // Holds score state
  int remainingRolls = 3; // Rolls left in current turn
  bool isGameOver = false; // Game over flag

  // Roll dice if rolls remain and game is not over
  void throwDice() {
    if (remainingRolls > 0 && !isGameOver) {
      diceInstance.roll();
      remainingRolls--;
      notifyListeners();
    }
  }

  // Toggle hold status for a die
  void toggleDiceHold(int index) {
    diceInstance.toggleHold(index);
    notifyListeners();
  }

  // Choose a score category if at least one roll has been made
  void chooseCategory(ScoreCategory category) {
    if (remainingRolls < 3) {
      try {
        scoreSheet.registerScore(category, diceInstance.values);
        _newTurn(); // Reset for next turn
        if (scoreSheet.completed) {
          _finishGame(); // End game if all categories filled
        }
        notifyListeners();
      } catch (e) {}
    }
  }

  // Start a new turn: clear dice and reset rolls
  void _newTurn() {
    diceInstance.clear();
    remainingRolls = 3;
  }

  // Set game over state
  void _finishGame() {
    isGameOver = true;
    notifyListeners();
  }

  // Restart the game to initial state
  void restartGame() {
    diceInstance = Dice(5);
    scoreSheet = ScoreCard();
    remainingRolls = 3;
    isGameOver = false;
    notifyListeners();
  }
}
