import 'package:animelist_flutter/responsive/mobile_screen_layout.dart';
import 'package:animelist_flutter/responsive/responsive_layout.dart';
import 'package:animelist_flutter/responsive/web_screen_layout.dart';
import 'package:animelist_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Lato',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            primary: primaryColor,
          )),
      title: 'Rabka Animelist',
      home: const Scaffold(
        body: ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout(),
        ),
      ),
    );
  }
}
