import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/data/themes.dart';
import 'package:provider/provider.dart';

class ChangeThemebutton extends StatefulWidget {
  const ChangeThemebutton({Key? key}) : super(key: key);

  @override
  State<ChangeThemebutton> createState() => _ChangeThemebuttonState();
}

class _ChangeThemebuttonState extends State<ChangeThemebutton> {
  bool Ison = false;
  bool Isicons = false;

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return IconButton(
        onPressed: () {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          Isicons = !Isicons;
          Ison = themeprovider.isDarkMode;
          provider.toggleTheme(Ison);
        },
        icon: Isicons
            ? const Icon(Icons.mode_night_outlined, color: Colors.grey)
            : const Icon(
                Icons.light_mode_outlined,
                color: Colors.grey,
              ));
  }
}
