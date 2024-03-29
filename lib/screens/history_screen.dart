import 'package:flutter/material.dart';
import 'package:flutter_calculator/providers/calculator_input.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          'History',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              model.removeHistory();
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
        centerTitle: true,
      ),
      body: Consumer<CalculatorProvider>(
        builder: (context, model, child) {
          return Container(
            margin: const EdgeInsets.all(20),
            child: ListView(
              reverse: true,
              children: [
                ...model.historyStorage.map(
                  (e) => GestureDetector(
                    onTap: () {
                      var expression = e.substring(0, e.indexOf('\n'));
                      model.updateAndPreviewExpression(expression);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      e,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 26,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
