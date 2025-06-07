import 'package:collection/collection.dart';
import 'dart:math';

/// Represents a set of dice for a game like Yahtzee.
class Dice {
  // Stores the current values of each die. Null means not yet rolled.
  final List<int?> _values;
  // Tracks which dice are currently held (not to be rolled).
  final List<bool> _held;

  /// Creates a Dice object with [numDice] dice.
  Dice(int numDice) 
  : _values = List<int?>.filled(numDice, null),
    _held = List<bool>.filled(numDice, false);

  /// Returns an unmodifiable list of the current dice values (excluding nulls).
  List<int> get values => List<int>.unmodifiable(_values.whereNotNull());

  /// Returns the value of the die at [index], or null if not rolled.
  int? operator [](int index) => _values[index];

  /// Returns true if the die at [index] is held.
  bool isHeld(int index) => _held[index];

  /// Clears all dice values and releases all holds.
  void clear() {
    for (var i = 0; i < _values.length; i++) {
      _values[i] = null;
      _held[i] = false;
    }
  }

  /// Rolls all dice that are not held, assigning them random values from 1 to 6.
  void roll() {
    for (var i = 0; i < _values.length; i++) {
      if (!_held[i]) {
        _values[i] = Random().nextInt(6) + 1;
      }
    }
  }

  /// Toggles the hold status of the die at [index].
  void toggleHold(int index) {
    _held[index] = !_held[index];
  }
}
