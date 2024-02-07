import 'dart:io';

import 'package:animelist_flutter/provider/drawer_toggle_provider.dart';
import 'package:animelist_flutter/responsive/mobile_screen_layout.dart';
import 'package:animelist_flutter/responsive/responsive_layout.dart';
import 'package:animelist_flutter/responsive/web_screen_layout.dart';
import 'package:animelist_flutter/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBWUE4n1ObruqecupJAwtkqfRgAaRwdNys",
        appId: "1:234164023787:web:5f08a003240706ce84a9ae",
        messagingSenderId: "234164023787",
        projectId: "animelist-flutter",
        storageBucket: "animelist-flutter.appspot.com",
      ),
    );
  } else if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB2VOdjUF3f2o5TZFJHHf9sfJZApAySmto",
        appId: "1:234164023787:android:a1b5027b60827f7284a9ae",
        messagingSenderId: "234164023787",
        projectId: "animelist-flutter",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrawerToggleProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<DrawerToggleProvider>(
          builder: (context, toggleProvider, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Poppins',
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: primaryColor,
                  primary: primaryColor,
                ),
                scaffoldBackgroundColor: toggleProvider.toggleValue
                    ? Colors.black87
                    : bgPrimaryColor,
              ),
              title: 'Rabka Animelist',
              home: const Scaffold(
                body: ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
