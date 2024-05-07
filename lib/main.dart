import 'package:all_hadis/const/color_const.dart';
import 'package:all_hadis/screen/hadith_screen.dart';
import 'package:all_hadis/screen/home.dart';
import 'package:all_hadis/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';

import 'const/text_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All Hadis',
      home: Home(),
    );
  }
}
