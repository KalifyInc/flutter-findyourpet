import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class ButtonSwitchTheme extends StatefulWidget {
  const ButtonSwitchTheme({super.key});

  @override
  State<ButtonSwitchTheme> createState() => _ButtonSwitchThemeState();
}

class _ButtonSwitchThemeState extends State<ButtonSwitchTheme> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(AppTheme.themeNotifier.value == ThemeMode.light
            ? Icons.dark_mode
            : Icons.light_mode),
        onPressed: () {
          AppTheme.themeNotifier.value =
              AppTheme.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
        });
  }
}
