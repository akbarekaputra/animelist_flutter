import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  final AdvancedDrawerController advancedDrawerController;

  const TopNav({
    super.key,
    required this.advancedDrawerController,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Rabka Animelist',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: IconButton(
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Icon(
                  value.visible ? Icons.clear : Icons.menu,
                  key: ValueKey<bool>(value.visible),
                ),
              );
            },
          ),
          onPressed: () {
            advancedDrawerController.showDrawer();
          },
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: IconButton(
            icon: const Icon(Icons.search, size: 25),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
