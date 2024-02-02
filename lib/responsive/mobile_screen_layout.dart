import 'dart:ui';

import 'package:animelist_flutter/libs/api_libs.dart';
import 'package:animelist_flutter/utils/colors.dart';
import 'package:animelist_flutter/widgets/banner_image.dart';
import 'package:animelist_flutter/widgets/bottom_nav.dart';
import 'package:animelist_flutter/widgets/continue_watching.dart';
import 'package:animelist_flutter/widgets/populer_anime.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  late Map<String, dynamic> topAnime;
  late List<dynamic> recommendedAnime;

  Future<void> fetchTopAnime() async {
    try {
      final Map<String, dynamic> anime =
          await getAnimeResponse("top/anime", "limit=8");
      setState(() {
        topAnime = anime;
      });
      print('Top Anime: $topAnime');
    } catch (e) {
      print('Error fetching top anime: $e');
    }
  }

  List<dynamic> reproduce(List<dynamic> list, int limit) {
    // Return a sublist of the provided list up to the specified limit
    return list.take(limit).toList();
  }

  Future<void> fetchRecommendedAnime() async {
    try {
      final anime =
          await getNestedAnimeResponse("recommendations/anime", "entry");
      setState(() {
        recommendedAnime = reproduce(anime, 8);
      });
      print('Recommended Anime: $recommendedAnime');
    } catch (e) {
      print('Error fetching recommended anime: $e');
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchRecommendedAnime();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rabka Animelist',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            icon: const Icon(Icons.menu, size: 30),
            color: primaryColor,
            onPressed: () {},
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(Icons.search, size: 30),
              color: primaryColor,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: BannerImage(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Continue Watching",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ContinueWatching(),
            ),
            PopulerAnime(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: const BottomNav(),
        ),
      ),
    );
  }
}
