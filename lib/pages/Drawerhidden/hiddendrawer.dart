import 'package:flutter/material.dart';
import 'package:todolist/pages/homepage.dart';
import 'package:todolist/pages/Drawerhidden/Drawer_widget.dart';
import 'package:flutter/services.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawingOpen;
  bool isDragging = false;

  void openDrawer() {
    setState(() {
      xOffset = 300;
      yOffset = 70;
      scaleFactor = 0.85;
      isDrawingOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawingOpen = false;
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    closeDrawer();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF04123F),
        body: Stack(
          children: [DrawerWidget(closedDrawer: closeDrawer), buildpage()],
        ),
      );

  Widget buildpage() {
    return GestureDetector(
      onHorizontalDragStart: (details) => isDragging = true,
      onHorizontalDragUpdate: (details) {
        if (isDragging) return;
        const delta = 1;
        if (details.delta.dx > delta) {
          openDrawer();
        } else if (details.delta.dx < delta) {
          closeDrawer();
        }
      },
      onTap: closeDrawer,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isDrawingOpen ? 30 : 0),
          child: MyHomePage(opendrawer: openDrawer),
        ),
      ),
    );
  }
}
