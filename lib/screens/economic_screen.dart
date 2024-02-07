import 'package:flutter/material.dart';

import 'package:flutter_calculator/data/economic_screen_list.dart';
import 'package:flutter_calculator/models/item.dart';

class EconomicScreen extends StatelessWidget {
  const EconomicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: economicItems.length,
      itemBuilder: (context, index) {
        Item item = economicItems[index];

        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    item.iconData,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                Text(
                  item.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: IconThemeData(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      item.description,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
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
