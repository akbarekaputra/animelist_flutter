import 'package:animelist_flutter/provider/drawer_toggle_provider.dart';
import 'package:animelist_flutter/utils/colors.dart';
import 'package:animelist_flutter/widgets/banner_image.dart';
import 'package:animelist_flutter/widgets/continue_watching.dart';
import 'package:animelist_flutter/widgets/custom_drawer.dart';
import 'package:animelist_flutter/widgets/populer_anime.dart';
import 'package:animelist_flutter/widgets/recommended_anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:animelist_flutter/widgets/top_nav.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    bool _toggleValue = Provider.of<DrawerToggleProvider>(context).toggleValue;

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: bgPrimaryColor),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      drawer: const CustomDrawer(),
      child: Scaffold(
        appBar: TopNav(advancedDrawerController: _advancedDrawerController),
        body: SingleChildScrollView(
          child: Container(
            color: _toggleValue == true ? Colors.black87 : bgPrimaryColor,
            child: Column(
              children: [
                SizedBox(height: 20),
                BannerImage(),
                ContinueWatching(),
                PopulerAnime(),
                RecommendedAnime(),
                SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
