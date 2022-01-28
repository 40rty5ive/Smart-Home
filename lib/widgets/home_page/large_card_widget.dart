// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LargeCardWidget extends StatelessWidget {
  const LargeCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Icon(
            Icons.music_note_outlined,
            size: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              SizedBox(
                height: 28,
              ),
              Text(
                'Music',
                style: TextStyle(
                    color: Color.fromRGBO(70, 70, 70, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Give a Little Bit',
                style: TextStyle(
                    color: Color.fromRGBO(189, 189, 189, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(width: 68),
          Row(
            children: [
              Icon(
                Icons.skip_previous,
                size: 24,
              ),
              SizedBox(width: 15),
              Icon(Icons.pause, size: 24),
              SizedBox(width: 15),
              Icon(
                Icons.skip_next,
                size: 24,
              )
            ],
          )
        ],
      ),
    );
  }
}
