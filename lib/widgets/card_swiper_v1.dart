import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';

class CardSwiperV1 extends StatelessWidget {
  final List<Article> noticias;

  final String titulo;
  const CardSwiperV1({Key? key, required this.noticias, required this.titulo})
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
          height: 250,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: noticias.length,
              itemBuilder: (_, index) {
                final noticia = noticias[index];
                return Container(
                  margin: const EdgeInsets.only(left: 45, right: 10, top: 8),
                  width: 315,
                  height: 250,
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
                            child: Hero(
                              tag: noticia.title ,
                              child: ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black26, BlendMode.darken),
                                  child: (noticias[index].urlToImage != null)
                                      ? Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              noticias[index].urlToImage!))
                                      : const Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://extyseg.com/wp-content/uploads/2019/04/EXTYSEG-imagen-no-disponible.jpg"))),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, right: 12),
                              child: Container(
                                width: 70,
                                height: 26,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 238, 238, 238),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 8),
                                  child: Text(noticias[index].source.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 142,
                              ),
                              SizedBox(
                                width: 270,
                                height: 62,
                                child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    noticias[index].title,
                                    style: Theme.of(context).textTheme.caption),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                width: 100,
                                height: 16,
                                child: Row(
                                  children: [
                                    Text("Leer más",
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Image(
                                        image:
                                            AssetImage("assets/arrowicon.png"))
                                  ],
                                ),
                              )
                            ],
                          ),
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
