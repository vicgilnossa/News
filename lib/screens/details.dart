import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/services/news_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Article argument =
        ModalRoute.of(context)!.settings.arguments as Article;
    print(argument.title);
    final Uri _url = Uri.parse(argument.url!);

    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: 520,
          color: const Color(0xffD9D9D9),
          child: Hero(
            tag: argument.title,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: (argument.urlToImage != null)
                    ? Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(argument.urlToImage!))
                    : const Image(
                        image: NetworkImage(
                            "https://www.fundaciontabitafeyes.org/wp-content/themes/childcare/images/default.png"))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 450),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                          child:
                              Image(image: AssetImage("assets/divider.png"))),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, left: 30, bottom: 16),
                      child: Container(
                        width: 350,
                        child: Text(argument.title,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 24,
                                color: const Color(0xff333333))),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              left: 30,
                              right: 6,
                            ),
                            child: Image(
                                image: AssetImage("assets/avatardetails.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: 120,
                              height: 18,
                              child: Text(argument.source.name,
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: const Color(0xff333333))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(argument.description!,
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: const Color(0xff555555))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _launchUrl(_url);
                        },
                        child: Row(
                          children: [
                            Text("Leer completa",
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: const Color(0xff555555))),
                            const SizedBox(
                              width: 4,
                            ),
                            const Image(
                                image: AssetImage("assets/arrowicon.png"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
