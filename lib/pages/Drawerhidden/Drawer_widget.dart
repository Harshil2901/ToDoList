import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/pages/Avatar_progress.dart';
import 'package:todolist/pages/chart.dart';
import 'package:todolist/pages/Drawerhidden/Drawer_items.dart';

class DrawerWidget extends StatefulWidget {
  VoidCallback closedDrawer;
  DrawerWidget({Key? key, required this.closedDrawer}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with SingleTickerProviderStateMixin {
  final double runanim = 0.4;
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildButton(context),
          const Progress_Avatar(),
          SizedBox(
            height: he * 0.02,
          ),
          _buildText(context),
          SizedBox(
            height: he * 0.02,
          ),
          buildDrawerItem(context),
          SizedBox(
            height: he * 0.02,
          ),
          const Chart()
        ],
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            children: DrawerItems.all
                .map((item) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 1),
                      leading: Icon(
                        item.icon,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      title: Text(
                        item.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: item.page,
                    ))
                .toList()),
      );

  Widget _buildButton(context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: he * 0.09, left: we * 0.15),
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration:
          const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      child: Container(
        width: 47,
        height: 47,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xFF04123F)),
        child: IconButton(
            onPressed: widget.closedDrawer,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              size: 20,
            )),
      ),
    );
  }

  Widget _buildText(context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(right: we * 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Johnny",
            style: GoogleFonts.lato(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white),
          ),
          Text(
            "Deep",
            style: GoogleFonts.lato(
                fontSize: 40,
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
