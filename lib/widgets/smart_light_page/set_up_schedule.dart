// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class SetUpSchedule extends StatefulWidget {
  const SetUpSchedule({Key? key}) : super(key: key);

  @override
  _SetUpScheduleState createState() => _SetUpScheduleState();
}

class _SetUpScheduleState extends State<SetUpSchedule> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.167,
      minChildSize: 0.167,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    TopLineWidget(),
                    EnableScheduleWidget(),
                    Divider(
                      height: 0,
                    ),
                    ChoseMonthWidget(),
                    SelectDayWidget(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CardDay {
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color borderColor;
  final String day;

  CardDay({
    required this.day,
    required this.textStyle,
    required this.backgroundColor,
    required this.borderColor,
  });
}

class SelectDayWidget extends StatelessWidget {
  SelectDayWidget({
    Key? key,
  }) : super(key: key);

  final _days = [
    CardDay(
      day: '01 Sat',
      textStyle: AppTextStyle.mediumWhiteText,
      backgroundColor: AppColors.mainGray,
      borderColor: AppColors.mainGray,
    ),
    CardDay(
      day: '02 Sun',
      textStyle: AppTextStyle.mediumLightGrayText,
      backgroundColor: Colors.white,
      borderColor: AppColors.mainLightGray,
    ),
    CardDay(
      day: '03 Mun',
      textStyle: AppTextStyle.mediumLightGrayText,
      backgroundColor: Colors.white,
      borderColor: AppColors.mainLightGray,
    ),
    CardDay(
      day: '04 Tue',
      textStyle: AppTextStyle.mediumWhiteText,
      backgroundColor: AppColors.mainGray,
      borderColor: AppColors.mainGray,
    ),
    CardDay(
      day: '05 Wed',
      textStyle: AppTextStyle.mediumWhiteText,
      backgroundColor: AppColors.mainGray,
      borderColor: AppColors.mainGray,
    ),
    CardDay(
      day: '06 Ths',
      textStyle: AppTextStyle.mediumLightGrayText,
      backgroundColor: Colors.white,
      borderColor: AppColors.mainLightGray,
    ),
    CardDay(
      day: '07 Fri',
      textStyle: AppTextStyle.mediumLightGrayText,
      backgroundColor: Colors.white,
      borderColor: AppColors.mainLightGray,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _days.length,
          separatorBuilder: (context, index) => SizedBox(
                width: 18,
              ),
          itemBuilder: (BuildContext context, int index) {
            final day = _days[index];
            return Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: day.backgroundColor,
                border: Border.all(
                  color: day.borderColor,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      day.day,
                      style: day.textStyle,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ChoseMonthWidget extends StatelessWidget {
  const ChoseMonthWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'January 2022',
                style: AppTextStyle.mainText,
              ),
              Text(
                'Select the desired date',
                style: AppTextStyle.microLightGrayMainText,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: AppColors.mainGray,
                size: 16,
              ),
              SizedBox(width: 20),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.mainGray,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EnableScheduleWidget extends StatefulWidget {
  const EnableScheduleWidget({Key? key}) : super(key: key);

  @override
  _EnableScheduleWidgetState createState() => _EnableScheduleWidgetState();
}

class _EnableScheduleWidgetState extends State<EnableScheduleWidget> {
  bool _setSchedule = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Schedule',
                style: AppTextStyle.mainText,
              ),
              Text(
                'Set schedule room light',
                style: AppTextStyle.microLightGrayMainText,
              )
            ],
          ),
          Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              onChanged: (bool value) {
                setState(() {
                  _setSchedule = value;
                });
              },
              value: _setSchedule,
              activeColor: AppColors.mainGray,
            ),
          ),
        ],
      ),
    );
  }
}

class TopLineWidget extends StatelessWidget {
  const TopLineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColors.mainGray,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
