import 'package:flutter/material.dart';
import 'package:flutter_calculator/models/calculator_model.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CalculatorModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'History',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop;
              model.removeHistory;
            },
            icon: Icon(Icons.delete_outline),
          ),
        ],
        centerTitle: true,
      ),
      body: Consumer<CalculatorModel>(
        builder: (context, model, child) {
          return Container(
            margin: const EdgeInsets.all(20),
            child: ListView(
              reverse: true,
              children: [
                ...model.historyStorage.map(
                  (e) => Text(
                    e,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 26),
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
