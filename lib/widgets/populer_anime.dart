import 'package:animelist_flutter/utils/api_libs.dart';
import 'package:animelist_flutter/provider/drawer_toggle_provider.dart';
import 'package:animelist_flutter/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopulerAnime extends StatefulWidget {
  const PopulerAnime({Key? key}) : super(key: key);

  @override
  State<PopulerAnime> createState() => _PopulerAnimeState();
}

class _PopulerAnimeState extends State<PopulerAnime> {
  late Future<Map<String, dynamic>> _topAnime;

  @override
  void initState() {
    super.initState();
    _topAnime = fetchTopAnime();
  }

  Future<Map<String, dynamic>> fetchTopAnime() async {
    try {
      final Map<String, dynamic> anime =
          await getAnimeResponse("top/anime", "limit=8");
      return anime;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching top anime: $e');
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _toggleValue = Provider.of<DrawerToggleProvider>(context).toggleValue;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Top Anime",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: _toggleValue == true
                            ? bgPrimaryColor
                            : Colors.black87,
                      ),
                    ),
                  ),
                  const Icon(Icons.navigate_next),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            height: 150,
            child: FutureBuilder<Map<String, dynamic>>(
              future: _topAnime,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: primaryColor,
                  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final topAnime = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topAnime['data']?.length ?? 0,
                    itemBuilder: (context, index) {
                      final imageUrl = topAnime['data'][index]['images']['webp']
                          ['image_url'];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.network(
                                  imageUrl.toString(),
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
