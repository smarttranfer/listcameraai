import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_ui/screens/home_screen.dart';
import 'package:flutter_youtube_ui/screens/nav_screen.dart';
import 'package:flutter_youtube_ui/screens/video_screen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      color: HexColor("#2B2F33"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: HexColor("#2B2F33"),
        brightness: Brightness.dark,
        bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: HexColor("#2B2F33")),
      ),
      home: HomeScreen(),
    );
  }
}
