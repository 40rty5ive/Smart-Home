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
          decoration: const BoxDecoration(
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
                    const TopLineWidget(),
                    const EnableScheduleWidget(),
                    const Divider(
                      height: 0,
                    ),
                    const SelectMonthWidget(),
                    SelectDayWidget(),
                    const SelectTimeWidget(),
                    const SelectAdvanceSettingsWidget(),
                    const BottomButtonsWidget(),
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

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 40,
            width: 160,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Cleare all'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(AppColors.mainGray),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            width: 160,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Schedule'),
              style: ButtonStyle(
                //textStyle: MaterialStateProperty.all(AppTextStyle.mediumWhiteText),
                backgroundColor: MaterialStateProperty.all(AppColors.mainGray),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectAdvanceSettingsWidget extends StatefulWidget {
  const SelectAdvanceSettingsWidget({Key? key}) : super(key: key);

  @override
  _SelectAdvanceSettingsWidgetState createState() =>
      _SelectAdvanceSettingsWidgetState();
}

class _SelectAdvanceSettingsWidgetState
    extends State<SelectAdvanceSettingsWidget> {
  String dropdownValue = 'Tone & intensity';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Advance setting',
            style: AppTextStyle.mainText,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 19,
          ),
          DropdownButtonFormField(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.mainGray,
              size: 16,
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainGray)),
              filled: false,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Name",
              fillColor: AppColors.mainGray,
            ),
            value: dropdownValue,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              'Tone & intensity',
              'Power',
              'Color',
              'Schedule',
            ].map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class SelectTimePickerWidget extends StatefulWidget {
  const SelectTimePickerWidget({Key? key}) : super(key: key);

  @override
  _SelectTimePickerWidgetState createState() => _SelectTimePickerWidgetState();
}

class _SelectTimePickerWidgetState extends State<SelectTimePickerWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectTime(context);
      },
      child: Row(
        children: [
          Container(
            width: 110,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.mainGray,
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Text(
              '${selectedTime.hourOfPeriod}:${selectedTime.minute}',
              style: AppTextStyle.smallMainText,
            ),
          ),
          Container(
            width: 50,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.mainGray,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Text(
              selectedTime.period.name.toUpperCase(),
              style: AppTextStyle.smallMainText,
            ),
          )
        ],
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(
        () {
          selectedTime = timeOfDay;
        },
      );
    }
  }
}

class SelectTimeWidget extends StatefulWidget {
  const SelectTimeWidget({Key? key}) : super(key: key);

  @override
  _SelectTimeWidgetState createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select the desired time',
            style: AppTextStyle.microLightGrayMainText,
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'On Time',
                      style: AppTextStyle.microMainText,
                    ),
                  ),
                  SelectTimePickerWidget(),
                ],
              ),
              const SizedBox(
                width: 13,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Off Time',
                      style: AppTextStyle.microMainText,
                    ),
                  ),
                  SelectTimePickerWidget(),
                ],
              ),
            ],
          ),
        ],
      ),
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
          separatorBuilder: (context, index) => const SizedBox(
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

class SelectMonthWidget extends StatelessWidget {
  const SelectMonthWidget({
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
            children: const [
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
            children: const [
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
            children: const [
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
