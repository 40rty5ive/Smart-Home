// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_home_layot/widgets/home_page/add_device_widget.dart';
import 'package:smart_home_layot/widgets/home_page/card_widget.dart';
import 'package:smart_home_layot/widgets/home_page/large_card_widget.dart';

class LivingRoomWidget extends StatefulWidget {
  const LivingRoomWidget({Key? key}) : super(key: key);

  @override
  State<LivingRoomWidget> createState() => _LivingRoomWidgetState();
}

class _LivingRoomWidgetState extends State<LivingRoomWidget> {
  @override
  

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardWidget(ico: Icons.light, text: 'Smart Light',),
              CardWidget(ico: Icons.thermostat, text: 'Smart AC',),
            ],
          ),
          SizedBox(height: 20,),
          LargeCardWidget(),
          SizedBox(height: 20,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardWidget(ico: Icons.tv, text: 'Smart TV',),
              CardWidget(ico: Icons.air, text: 'Smart Fan',),
            ],
          ),
          SizedBox(height: 20,),
          AddDeviceWidget(),
        ],
      ),
    );
  }
}
