import 'package:flutter/material.dart';
import 'package:smart_home_layot/widgets/home_page/living_room_widget.dart';

import '../../resources/resources.dart';

class HomeTabWidget extends StatefulWidget {
  const HomeTabWidget({Key? key}) : super(key: key);

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Hi, Drax',
                style: TextStyle(
                  color: Color.fromRGBO(70, 70, 70, 1.0),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image(
                image: AssetImage(Images.userPhoto),
                height: 40,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 18),
          child: 
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Living Room',
                  style: TextStyle(
                    color: Color.fromARGB(255, 70, 70, 70),
                    fontSize: 18,
                  ),
                ),
              ),
              const TextButton(
                onPressed: null,
                child: Text(
                  'Dining',
                  style: TextStyle(
                    color: Color.fromARGB(255, 189, 189, 189),
                    fontSize: 18,
                  ),
                ),
              ),
              const TextButton(
                onPressed: null,
                child: Text(
                  'Kitchen',
                  style: TextStyle(
                    color: Color.fromARGB(255, 189, 189, 189),
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        const LivingRoomWidget(),
      ],
    );
  }
}
