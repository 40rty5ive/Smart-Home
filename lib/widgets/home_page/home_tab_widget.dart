import 'package:flutter/material.dart';
import 'package:smart_home_layot/widgets/home_page/living_room_widget.dart';

import '../../resources/resources.dart';
import '../../theme/app_colors.dart';

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
                  color: AppColors.mainGray,
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
        DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TabBar(
                indicatorColor: AppColors.mainGray,
                labelColor: AppColors.mainGray,
                unselectedLabelColor: AppColors.mainLightGray,
                tabs: [
                  Tab(text: 'Living Room'),
                  Tab(text: 'Dining'),
                  Tab(text: 'Kitchen'),
                ],
              ),
              Container(
                height: 600,
                child: const TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: LivingRoomWidget(),
                    ),
                    Center(
                      child: Text(
                        'Dining',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Kitchen',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}