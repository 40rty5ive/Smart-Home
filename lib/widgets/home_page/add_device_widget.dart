import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class AddDeviceWidget extends StatelessWidget {
  const AddDeviceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color.fromRGBO(189, 189, 189, 1),
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      strokeWidth: 1,
      child: Container(
        width: 360,
        height: 75,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.add,
              size: 35,
              color: Color.fromRGBO(192, 192, 192, 1),
            ),
            SizedBox(
              width: 20,
            ),
            Text('Add New Devise',
                style: TextStyle(
                  color: Color.fromRGBO(192, 192, 192, 1),
                )),
          ],
        ),
      ),
    );
  }
}
