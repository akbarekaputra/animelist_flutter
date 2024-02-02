import 'package:animelist_flutter/api_libs.dart';
import 'package:animelist_flutter/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RecommendedAnime extends StatefulWidget {
  const RecommendedAnime({Key? key}) : super(key: key);

  @override
  State<RecommendedAnime> createState() => _RecommendedAnimeState();
}

class _RecommendedAnimeState extends State<RecommendedAnime> {
  late Future<Map<String, dynamic>> _recommendedAnime;

  Future<Map<String, dynamic>> fetchRecommendedAnime() async {
    try {
      final nestedAnimeResponse =
          await getNestedAnimeResponse("recommendations/anime", "entry");
      return reproduce(nestedAnimeResponse, 8);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching recommended anime: $e');
      }
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    _recommendedAnime = fetchRecommendedAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Recommended Anime",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Icon(Icons.navigate_next),
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
              future: _recommendedAnime,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: primaryColor,
                  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final recommendedAnime = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedAnime['data']?.length ?? 0,
                    itemBuilder: (context, index) {
                      final imageUrl = recommendedAnime['data'][index]['images']
                          ['webp']['image_url'];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: GestureDetector(
                                onTap: () {
                                  if (kDebugMode) {
                                    print(
                                      recommendedAnime['data'][index]['mal_id'],
                                    );
                                  }
                                },
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
