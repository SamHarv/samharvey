import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samharvey/config/constants.dart';

import 'ui/views/portfolio_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: black),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sam Harvey Portfolio',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(primary: black, secondary: blue),
        primaryColor: black,
        scaffoldBackgroundColor: black,
        textTheme: GoogleFonts.openSansTextTheme().apply(
          bodyColor: white,
          displayColor: white,
        ),
        appBarTheme: AppBarTheme(
          color: black,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: black),
        ),
      ),
      home: const PortfolioView(),
    );
  }
}
