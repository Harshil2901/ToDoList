import "package:flutter/material.dart";
import 'package:todolist/pages/Drawerhidden/hiddendrawer.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/shared/Task_saved.dart';
import 'package:todolist/data/themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TaskerPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            title: "Fluttter Demo",
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            darkTheme: Mytheme.darktheme,
            theme: Mytheme.lighttheme,
            home: HiddenDrawer(),
          );
        },
      );
}
