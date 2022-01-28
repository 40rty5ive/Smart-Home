import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final IconData ico;
  final String text;

  

  const CardWidget({
    Key? key,
    required this.ico,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _smartLightChoose = true;
    return Container(
      width: 170,
      height: 135,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  ico,
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
            
            text,
            style: TextStyle(
              color: Color.fromRGBO(70, 70, 70, 1.0),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
