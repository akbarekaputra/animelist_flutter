import 'package:animelist_flutter/utils/colors.dart';
import 'package:animelist_flutter/widgets/banner_image.dart';
import 'package:animelist_flutter/widgets/continue_watching.dart';
import 'package:animelist_flutter/widgets/custom_drawer.dart';
import 'package:animelist_flutter/widgets/populer_anime.dart';
import 'package:animelist_flutter/widgets/recommended_anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:animelist_flutter/widgets/top_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
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
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const CustomDrawer(),
      child: Scaffold(
        appBar: TopNav(advancedDrawerController: _advancedDrawerController),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              BannerImage(),
              ContinueWatching(),
              PopulerAnime(),
              RecommendedAnime(),
              SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}
