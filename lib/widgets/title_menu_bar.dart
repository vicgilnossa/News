import 'package:flutter/material.dart';

class TitleandMenuBar extends StatelessWidget {
  final String titulo;
  const TitleandMenuBar({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 58),
          child: Container(
              width: 118,
              height: 31,
              child: Text(
                titulo,
                style: Theme.of(context).textTheme.subtitle2,
              )),
        ),
        const SizedBox(
          width: 191,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 30, top: 61),
          child: SizedBox(
              width: 24,
              height: 24,
              child: Image(image: AssetImage("assets/hamburgermenu.png"))),
        )
      ],
    );
  }
}