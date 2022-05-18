import 'package:flutter/material.dart';

class CustomTitles extends StatelessWidget {
  final String title;
  final Color txtColor;
  final double txtSize;
  const CustomTitles(
      {Key? key,
      required this.title,
      required this.txtColor,
      required this.txtSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: txtColor,
              fontWeight: FontWeight.w500,
              fontSize: txtSize,
            ),
          ),
        ],
      ),
    );
  }
}
