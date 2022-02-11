import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CardWidget extends StatefulWidget {
  final IconData ico;
  final String text;

  const CardWidget({
    Key? key,
    required this.ico,
    required this.text,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  void _onCardTap() {
    Navigator.of(context).pushNamed('/homePage/smart_light');
  }

  @override
  Widget build(BuildContext context) {
    bool _smartLightChoose = false;
    return SizedBox(
      width: 170,
      height: 135,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        widget.ico,
                        size: 33,
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          onChanged: (bool value) {
                            setState(() {
                              _smartLightChoose = value;
                            });
                          },
                          value: _smartLightChoose,
                          activeColor: AppColors.mainGray,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(
                    color: AppColors.mainGray,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => _onCardTap(),
            ),
          ),
        ],
      ),
    );
  }
}
