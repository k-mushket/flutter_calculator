import 'package:flutter/material.dart';

class EconomicScreen extends StatelessWidget {
  const EconomicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 13,
      itemBuilder: (context, index) {
        return IconButton(
          onPressed: () {},
          icon: Icon(Icons.cake),
        );
      },
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
