import 'package:animelist_flutter/libs/api_libs.dart';
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
      final anime =
          await getNestedAnimeResponse("recommendations/anime", "entry");
      return reproduceRecommendedAnime(anime, 8);
    } catch (e) {
      print('Error fetching recommended anime: $e');
      throw e;
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
                  return const Center(child: CircularProgressIndicator());
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
                                  print(recommendedAnime['data'][index]
                                      ['mal_id']);
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
                  return Center(child: Text('No data available'));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
