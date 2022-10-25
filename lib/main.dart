import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/screens.dart';

import 'package:news_app/services/news_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const HomeScreen(),
        routes: {
          "details": (_) => const DetailScreen(),
          "categories": (_) => const CategoriesScreen(),
        },
        theme: ThemeData(
            textTheme: TextTheme(
          subtitle2: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: const Color(0xff333333)),
          subtitle1: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: const Color(0xff333333)),
          bodyText1: GoogleFonts.dmSans(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: const Color(0xff666666)),
          bodyText2: GoogleFonts.dmSans(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 8,
              color: Color(0xff333333)),
          caption: GoogleFonts.dmSans(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white),
          overline: GoogleFonts.dmSans(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.white),
        )),
      ),
    );
  }
}
