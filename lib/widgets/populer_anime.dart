import 'package:animelist_flutter/libs/api_libs.dart';
import 'package:flutter/material.dart';

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
      print('Error fetching top anime: $e');
      throw e;
    }
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
                      "Top Anime",
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
            height: 160,
            child: FutureBuilder<Map<String, dynamic>>(
              future: _topAnime,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
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
                                onTap: () =>
                                    print(topAnime['data'][index]['mal_id']),
                                child: Image.network(
                                  imageUrl.toString(),
                                  height: 160,
                                  width: 90,
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
