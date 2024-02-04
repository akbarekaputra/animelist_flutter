import 'package:animelist_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: ListTileTheme(
          textColor: Colors.black,
          iconColor: primaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/placeholder_16_9.png',
                        width: 75,
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Akbar Eka Putra",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "xyz123@gmail.com",
                          style: TextStyle(color: secondaryColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      color: bgSecondaryColor,
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(right: 32),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Dark Mode",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: _toggleValue,
                      onChanged: (value) {
                        setState(() {
                          _toggleValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.download),
                title: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Download",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Watch videos offline",
                          style: TextStyle(fontSize: 10, color: secondaryColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      color: bgSecondaryColor,
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.checklist),
                title: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wathclist",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Watch videos offline",
                          style: TextStyle(fontSize: 10, color: secondaryColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      color: bgSecondaryColor,
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.category),
                title: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genres",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Watch videos offline",
                          style: TextStyle(fontSize: 10, color: secondaryColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      color: bgSecondaryColor,
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.help),
                title: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Help",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Watch videos offline",
                          style: TextStyle(fontSize: 10, color: secondaryColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      color: bgSecondaryColor,
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Watch videos offline",
                          style: TextStyle(fontSize: 10, color: secondaryColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      color: bgSecondaryColor,
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
