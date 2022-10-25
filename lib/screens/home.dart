import 'package:flutter/material.dart';

import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const TitleandMenuBar(
                titulo: 'Explora',
              ),
              const SizedBox(
                height: 26,
              ),
              const SearchBar(),
              const SizedBox(
                height: 26,
              ),
              const CategoriesBar(),
              const SizedBox(
                height: 40,
              ),
              CardSwiperV1(
                noticias: newsService.headlines,
                titulo: "Actualidad",
              ),
              const SizedBox(
                height: 40,
              ),
              CardSwiperV2(
                  noticias: newsService.entertaiment,
                  titulo: "Entretenimiento"),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
