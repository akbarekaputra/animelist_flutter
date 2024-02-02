import 'package:animelist_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class ContinueWatching extends StatelessWidget {
  const ContinueWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          5,
          (index) => Padding(
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
                SizedBox(height: 7),
                Stack(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
