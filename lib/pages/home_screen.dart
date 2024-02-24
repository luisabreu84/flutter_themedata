import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme.of(context).brightness == Brightness.light 
              ? Icon(Icons.sunny, size: 100, color: Colors.yellow[900])
              : const Icon(Icons.dark_mode, size: 100, color: Colors.black),
            const SizedBox(height: 15),
            Text(Theme.of(context).brightness == Brightness.light ? 'Light' : 'Dark', style: Theme.of(context).textTheme.displayMedium)
          ]
        )
      );
  }
}