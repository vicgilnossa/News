import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.circular(8)),
        width: 315,
        height: 44,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Image(image: AssetImage("assets/searchicon.png")),
      )
    ]);
  }
}
