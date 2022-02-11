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
          const SizedBox(width: 20),
          const Icon(
            Icons.music_note_outlined,
            size: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: const [
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
          const SizedBox(width: 68),
          Row(
            children: const [
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
