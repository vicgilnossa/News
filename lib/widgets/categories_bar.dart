import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:provider/provider.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 10),
          height: 48,
          child: CategoryChips(),
        )
      ],
    );
  }
}

class CategoryChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final categories = Provider.of<NewsService>(context).categories;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            final newsService =
                Provider.of<NewsService>(context, listen: false);
            newsService.selectedCategory = categories[index].backendname;
            Navigator.pushNamed(context, "categories");
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(
              left: 15,
            ),
            width: 100,
            height: 36,
            decoration: BoxDecoration(
                color: (newsService.selectedCategory ==
                        categories[index].backendname)
                    ? Colors.black87
                    : Color.fromARGB(255, 238, 238, 238),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                categories[index].showname,
                style: TextStyle(color: Color(0xff999999), fontSize: 14),
              ),
            ),
          ),
        );
      },
    );
  }
}
