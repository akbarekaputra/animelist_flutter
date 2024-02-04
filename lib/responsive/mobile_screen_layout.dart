import 'package:animelist_flutter/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:animelist_flutter/widgets/bottom_nav.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  late PageController pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  List<Map<String, dynamic>> navItems = [
    {"page": "Home", "icon": Icons.home},
    {"page": "Series", "icon": Icons.tv},
    {"page": "Movies", "icon": Icons.movie},
    {"page": "Local", "icon": Icons.location_on},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems, // You should pass your pages here
      ),
      extendBody: true,
      bottomNavigationBar: BottomNav(
        currentPage: _page,
        navItems: navItems,
        onTap: navigationTapped,
      ),
    );
  }
}
