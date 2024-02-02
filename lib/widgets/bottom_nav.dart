import 'dart:ui';

import 'package:animelist_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  String page = "Home";

  List<Map<String, dynamic>> navItems = [
    {"page": "Home", "icon": Icons.home},
    {"page": "Series", "icon": Icons.tv},
    {"page": "Movies", "icon": Icons.movie},
    {"page": "Local", "icon": Icons.location_on},
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: BottomAppBar(
          color: bgPrimaryColor.withOpacity(0.5),
          height: 68,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              for (int index = 0; index < navItems.length; index++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      page = navItems[index]["page"];
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        navItems[index]["icon"],
                        color: page == navItems[index]["page"]
                            ? primaryColor
                            : secondaryColor,
                      ),
                      Text(
                        navItems[index]["page"],
                        style: TextStyle(
                          color: page == navItems[index]["page"]
                              ? primaryColor
                              : secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
