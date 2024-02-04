import 'package:animelist_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class ContinueWatching extends StatelessWidget {
  const ContinueWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Continue Watching",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Icon(Icons.navigate_next),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            "assets/placeholder_16_9.png",
                            height: 90,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Stack(
                            children: [
                              Container(
                                width: 160,
                                height: 3,
                                color: bgSecondaryColor,
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 70,
                                  height: 3,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
