import 'package:animelist_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  String page = "Home";

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: bgPrimaryColor.withOpacity(0.5),
      height: 68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                page = "Home";
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  color: page == "Home" ? primaryColor : secondaryColor,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    color: page == "Home" ? primaryColor : secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                page = "Series";
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.tv,
                  color: page == "Series" ? primaryColor : secondaryColor,
                ),
                Text(
                  "Series",
                  style: TextStyle(
                    color: page == "Series" ? primaryColor : secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                page = "Movies";
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.movie,
                  color: page == "Movies" ? primaryColor : secondaryColor,
                ),
                Text(
                  "Movies",
                  style: TextStyle(
                    color: page == "Movies" ? primaryColor : secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                page = "Local";
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.location_on,
                  color: page == "Local" ? primaryColor : secondaryColor,
                ),
                Text(
                  "Local",
                  style: TextStyle(
                    color: page == "Local" ? primaryColor : secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
