import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base/routes.dart';

class HomeButton extends StatelessWidget {
  Color textColor;
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  Color color;
  String title;
  IconData? icon;
  String routName;
  HomeButton(
      {super.key,
      required this.routName,
      this.title = ' ',
      this.textColor = Colors.white,
      this.icon,
      this.color = Colors.green,
      this.topLeft = 0,
      this.topRight = 0,
      this.bottomLeft = 0,
      this.bottomRight = 0});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(topRight),
                      topLeft: Radius.circular(topLeft),
                      bottomRight: Radius.circular(bottomRight),
                      bottomLeft: Radius.circular(bottomLeft)),
                  side: BorderSide(color: color)))),
      onPressed: () {
        Navigator.of(context).pushNamed(routName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon != null
              ? Icon(
                  icon,
                  size: 100,
                )
              : SizedBox(),
          Text(
            title,
            style: TextStyle(fontSize: 20, color: textColor),
          )
        ],
      ),
    );
  }
}
