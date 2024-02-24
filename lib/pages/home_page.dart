import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themedata/theme/theme_provider.dart';

import 'home_screen.dart';
import 'settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SettingScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    Provider.of<ThemeProvider>(context, listen: false).toggleThemeBySystem();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Theme App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Settings')
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          onItemTap(index);
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}