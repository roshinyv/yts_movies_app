import 'package:flutter/material.dart';

class PopularBar extends StatelessWidget {
  final String title;
  const PopularBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [Colors.grey.shade700, Colors.grey.shade900])),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            // elevation: 5,
            primary: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(title),
      ),
    );
  }
}
