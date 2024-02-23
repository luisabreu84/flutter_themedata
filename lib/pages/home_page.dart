import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themedata/theme/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Theme'),
        actions: [
          Switch(value: Theme.of(context).brightness == Brightness.dark, onChanged: (isOn) {
            setState(() {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            });
          })
        ],
      ),
      body: Center(
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
      ),
    );
  }
}