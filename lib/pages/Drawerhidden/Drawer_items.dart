import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/constant/constant.dart';

class DrawerItem {
  String title;
  IconData icon;
  VoidCallback page;

  DrawerItem({required this.title, required this.icon, required this.page});
}

class DrawerItems {
  // static final categorise =
  //     DrawerItem(title: "Categorise", icon: Icons.grid_view_outlined);
  // static final analytics =
  //     DrawerItem(title: "Analytics", icon: FontAwesomeIcons.chartPie);
  // static final about = DrawerItem(title: "About", icon: Icons.person_outlined);
  static final logout = DrawerItem(
      title: "Logout",
      icon: Icons.logout,
      page: () {
        _handleLogout();
      });
  static final List<DrawerItem> all = [
    // categorise,
    //  analytics,
    //  about,
    logout
  ];
}

Future<void> _handleLogout() async {
  var sharedPref = await SharedPreferences.getInstance();
  var token = sharedPref.getString('token');

  if (token != null) {
    http.Response response = await http.get(Uri.parse(logoutNote),
        headers: {'Content-Type': 'application/json', 'Authorization': token});

    if (response.statusCode == 200) {
      print('Logout successfull');
    } else {
      print('error while logout');
      print(token);
    }
  } else {
    print('token not found');
  }
}
