import 'package:animelist_flutter/screens/home_screen.dart';
import 'package:animelist_flutter/screens/local_screen.dart';
import 'package:animelist_flutter/screens/movies_screen.dart';
import 'package:animelist_flutter/screens/series_screen.dart';
import 'package:animelist_flutter/screens/signup_screen.dart';
import 'package:flutter/material.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const HomeScreen(),
  const SignupScreen(),
  const SeriesScreen(),
  const MoviesScreen(),
  const LocalScreen(),
];
