import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/game_controller.dart';
import '../models/scorecard.dart';

class ScoreSheet extends StatelessWidget {
  const ScoreSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameCtrl = Provider.of<GameController>(context);
    final scoreData = gameCtrl.scoreSheet;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: ScoreCategory.values.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: MediaQuery.of(context).size.height / 12,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (ctx, idx) {
        final category = ScoreCategory.values[idx];
        final score = scoreData[category];

        return GestureDetector(
          onTap: score == null ? () => gameCtrl.chooseCategory(category) : null,
          child: Container(
            decoration: BoxDecoration(
              color: score == null ? Colors.white : Colors.grey[300],
              border: Border.all(
                color: Colors.green,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    score?.toString() ?? '-',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
