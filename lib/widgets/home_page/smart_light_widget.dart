// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart_home_layot/resources/resources.dart';

class SmartLightWidget extends StatelessWidget {
  const SmartLightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back),
            ),
          ),
          Container(
            width: 150,
            padding: EdgeInsets.fromLTRB(20, 99, 0, 0),
            child: Text(
              'Living Room',
              style: TextStyle(
                color: Color.fromRGBO(70, 70, 70, 1),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Image(
              image: AssetImage(Images.lampOrange),
            ),
          ),
        ],
      ),
    );
  }
}
