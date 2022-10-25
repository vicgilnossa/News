import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 57, left: 40),
              width: 150,
              height: 23,
              child: (newsService.selectedCategory == "business")
                  ? Text("Negocios",
                      style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: const Color(0xff333333)))
                  : (newsService.selectedCategory == "entertainment")
                      ? Text("Entretenimiento",
                          style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: const Color(0xff333333)))
                      : (newsService.selectedCategory == "general")
                          ? Text("Actualidad",
                              style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: const Color(0xff333333)))
                          : (newsService.selectedCategory == "health")
                              ? Text("Salud",
                                  style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: const Color(0xff333333)))
                              : (newsService.selectedCategory == "science")
                                  ? Text("Ciencia",
                                      style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: const Color(0xff333333)))
                                  : (newsService.selectedCategory == "sports")
                                      ? Text("Deportes",
                                          style: GoogleFonts.dmSans(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: const Color(0xff333333)))
                                      : (newsService.selectedCategory ==
                                              "technology")
                                          ? Text("Tecnología",
                                              style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18,
                                                  color:
                                                      const Color(0xff333333)))
                                          : Text(newsService.selectedCategory,
                                              style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18,
                                                  color:
                                                      const Color(0xff333333))),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                width: 1600,
                height: 720,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CardGrid(
                      noticias: newsService.getArticleByCategorySelected!),
                )),
            Container(),
          ],
        ),
      ),
    );
  }
}
