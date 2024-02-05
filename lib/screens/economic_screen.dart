import 'package:flutter/material.dart';

import 'package:flutter_calculator/models/item.dart';
import 'package:flutter_calculator/data/economic_screen_list.dart';

class EconomicScreen extends StatelessWidget {
  const EconomicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: economicItems.length,
      itemBuilder: (context, index) {
        Item item = economicItems[index];

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent,
            elevation: 0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    item.iconData,
                    color: Colors.black,
                  ),
                ),
                Text(
                  item.description,
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: const IconThemeData(
                      color: Colors.black,
                    ),
                    title: Text(
                      item.description,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    centerTitle: true,
                  ),
                  body: item.widget,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
