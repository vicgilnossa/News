import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/news_response.dart';

class CardSwiperV2 extends StatelessWidget {
  final List<Article> noticias;
  final String titulo;
  const CardSwiperV2({Key? key, required this.noticias, required this.titulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Text(
                  titulo,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Text(
                  "Ver todo",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          height: 171,
          child: ListView.builder(
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: noticias.length,
              itemBuilder: (_, index) {
                final noticia = noticias[index];
                return Container(
                  margin: const EdgeInsets.only(left: 20, right: 10, top: 8),
                  width: 208,
                  height: 171,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "details",
                          arguments: noticia);
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 315,
                          height: 250,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: (noticias[index].urlToImage != null)
                                  ? Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          noticias[index].urlToImage!))
                                  : const Image(
                                      image: NetworkImage(
                                          "https://www.fundaciontabitafeyes.org/wp-content/themes/childcare/images/default.png"))),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 61,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 238, 238, 238),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16))),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 8),
                                      child: Container(
                                        width: 180,
                                        height: 18,
                                        child: Text(noticias[index].title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12,
                                                color:
                                                    const Color(0xff333333))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          const Image(
                                              image: AssetImage(
                                                  "assets/avatar1.png")),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Container(
                                              width: 100,
                                              height: 18,
                                              child: (noticias[index].author !=
                                                      null)
                                                  ? Text(
                                                      noticias[index].author!,
                                                      style: GoogleFonts.dmSans(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10,
                                                          color: const Color(
                                                              0xff666666)),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  : const Text("Sin autor")),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Image(
                                              image: AssetImage(
                                                  "assets/avatar2.png")),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "2 mins",
                                            style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                color: const Color(0xff666666)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
