import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                print("your menu action here");
              },
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type your search here",
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.keyboard_voice_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                print("your menu action here");
              },
            ),
          ],
        ),
      ),
    );
  }
}
