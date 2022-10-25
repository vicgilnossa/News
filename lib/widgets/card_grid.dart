import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/news_response.dart';
import '../services/news_service.dart';

class CardGrid extends StatelessWidget {
  final List<Article> noticias;
  const CardGrid({
    Key? key,
    required this.noticias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.builder(
        itemCount: noticias.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 210,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemBuilder: (_, index) {
          final noticia = noticias[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "details", arguments: noticia);
            },
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 152,
                height: 210,
                child: (noticias[index].urlToImage != null)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                              Colors.black45, BlendMode.darken),
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(noticias[index].urlToImage!)),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                            width: 152, height: 210, color: Color(0xffD9D9D9)),
                      ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 122, left: 12),
                width: 120,
                height: 65,
                child: Text(noticias[index].title,
                    style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: const Color(0xffFFFFFF))),
              )
            ]),
          );
        },
      ),
    );
  }
}
