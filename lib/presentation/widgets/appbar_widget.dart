import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Action",
      "Animation",
      "Drama",
      "Comedy",
      "Crime",
      "Fantasy",
      "Horror",
      "Romance",
      "Science Fiction",
      "Thriller",
      "Other",
    ];
    return SafeArea(
      child: Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                          height: 25,
                          child: Image.asset('assets/images/yts_logo.png')),
                      const SizedBox(
                        width: 5,
                      ),
                      // SizedBox(
                      //     // height: 1,
                      //     width: 50,
                      //     child: Image.asset(
                      //       'assets/images/6.png',
                      //       fit: BoxFit.fitWidth,
                      //     )),
                      const SizedBox(
                        width: 12,
                      ),
                      const VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                        width: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 5.0),
                          child: ElevatedButton(
                            child: Text(categories[index]),
                            onPressed: () => print("it's pressed"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black45,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ))),
                ))
          ],
        ),
      ),
    );
  }
}
