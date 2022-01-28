// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final IconData ico;
  final String text;

  const CardWidget({
    Key? key,
    required this.ico,
    required this.text,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  void _onCardTap() {
    Navigator.of(context).pushNamed('/homePage/smart_light');
  }

  @override
  Widget build(BuildContext context) {
    bool _smartLightChoose = true;
    return Container(
      width: 170,
      height: 135,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        widget.ico,
                        size: 33,
                      ),
                      Switch(
                        value: _smartLightChoose,
                        onChanged: (bool value) {},
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.text,
                  
                  style: TextStyle(
                    color: Color.fromRGBO(70, 70, 70, 1.0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => _onCardTap(),
            ),
          ),
        ],
      ),
    );
  }
}
