import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/game_controller.dart';
import 'views/play_screen.dart';

void main() {
  runApp(const YahtzeeApp());
}

class YahtzeeApp extends StatelessWidget {
  const YahtzeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yahtzee Game',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const PlayScreen(),
      ),
    );
  }
}
