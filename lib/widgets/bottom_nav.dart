import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animelist_flutter/utils/colors.dart';

class BottomNav extends StatelessWidget {
  final int currentPage;
  final List<Map<String, dynamic>> navItems;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentPage,
    required this.navItems,
    required this.onTap,
  });

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
                  onTap: () => onTap(index),
                  child: Column(
                    children: [
                      Icon(
                        navItems[index]["icon"],
                        color: currentPage == index
                            ? primaryColor
                            : secondaryColor,
                      ),
                      Text(
                        navItems[index]["page"],
                        style: TextStyle(
                          color: currentPage == index
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
