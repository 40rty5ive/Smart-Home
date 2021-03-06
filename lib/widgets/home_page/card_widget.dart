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

  bool _smartLightChoose = true;
  @override
  Widget build(BuildContext context) {
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
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        widget.ico,
                        size: 33,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
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
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(20),
            child: Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                value: _smartLightChoose,
                onChanged: (bool value) {
                  setState(
                    () {
                      _smartLightChoose = value;
                    },
                  );
                },
                activeColor: AppColors.mainGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
