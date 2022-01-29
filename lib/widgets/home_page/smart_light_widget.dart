// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_layot/resources/resources.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class SmartLightWidget extends StatefulWidget {
  const SmartLightWidget({Key? key}) : super(key: key);

  @override
  State<SmartLightWidget> createState() => _SmartLightWidgetState();
}

class _SmartLightWidgetState extends State<SmartLightWidget> {
  bool _powerVal = false;
  Color firstButtonColor = AppColors.mainGray;
  Color firstTextColor = Colors.white;
  Color secondButtonColor = Colors.white;
  Color secondTextColor = AppColors.mainGray;
  double _sliderValue = 0.23;

  void _tabOnFirstButton() {
    setState(() {
      firstButtonColor = AppColors.mainGray;
      firstTextColor = Colors.white;
      secondButtonColor = Colors.white;
      secondTextColor = AppColors.mainGray;
    });
  }

  void _tabOnSecondButton() {
    setState(() {
      firstButtonColor = Colors.white;
      firstTextColor = AppColors.mainGray;
      secondButtonColor = AppColors.mainGray;
      secondTextColor = Colors.white;
    });
  }

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
                color: AppColors.mainGray,
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 239,
            ),
            child: Column(children: [
              Text(
                'Power',
                style: AppTextStyle.mainText,
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  onChanged: (bool value) {
                    setState(() {
                      _powerVal = value;
                    });
                  },
                  value: _powerVal,
                  activeColor: AppColors.mainGray,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Color',
                style: AppTextStyle.mainText,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  Images.changeColor,
                ),
                iconSize: 40,
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 456, 20, 0),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tone Glow',
                  style: AppTextStyle.mainText,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: _tabOnFirstButton,
                      child: Container(
                        height: 32,
                        width: (MediaQuery.of(context).size.width * 0.5) - 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: firstButtonColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            )),
                        child: Text(
                          'Warm',
                          style: TextStyle(
                            color: firstTextColor,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _tabOnSecondButton,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        height: 32,
                        width: (MediaQuery.of(context).size.width * 0.5) - 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: secondButtonColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            )),
                        child: Text(
                          'Cold',
                          style: TextStyle(
                            color: secondTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Intensity',
                            style: AppTextStyle.mainText,
                          ),
                          Text(
                            '${(_sliderValue * 100).toStringAsFixed(0)} %',
                            style: AppTextStyle.smallMainText,
                          ),
                        ],
                      ),
                      Slider(
                        max: 1,
                        activeColor: AppColors.mainGray,
                        inactiveColor: Colors.white,
                        value: _sliderValue,
                        onChanged: (double value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Off',
                              style: AppTextStyle.microMainText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '100%',
                              style: AppTextStyle.microMainText,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
