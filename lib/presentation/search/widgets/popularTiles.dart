import 'package:flutter/material.dart';
import 'package:yts_app/presentation/search/widgets/popularBar.dart';


class PopularTiles extends StatelessWidget {
  final String title1;
  final String title2;

  const PopularTiles({Key? key, required this.title1, required this.title2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: PopularBar(
                    title: title1,
                  ),
                ),
                PopularBar(
                  title: title2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
