import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import '../theme/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {

    bool isUsingSystemAppearance = Provider.of<ThemeProvider>(context).isUsingSystemAppearance;
    bool isUsingDarkMode = Provider.of<ThemeProvider>(context).isUsingDarkMode;

    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('Appearance'),
          tiles: <SettingsTile>[
            SettingsTile.switchTile(
              onToggle: (value) {
                Provider.of<ThemeProvider>(context, listen: false).setUseOfSystemAppearance(value);
              },
              initialValue: isUsingSystemAppearance,
              leading: const Icon(Icons.format_paint),
              title: const Text('Use system appearance'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
              initialValue: isUsingDarkMode,
              leading: const Icon(Icons.dark_mode),
              title: const Text('Use dark appearance'),
              enabled: !isUsingSystemAppearance,
            ),
          ],
        ),
        SettingsSection(
          title: const Text('Languaje'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              value: const Text('English'),
              enabled: false,
            )
          ],
        ),
      ],
    );
  }
}