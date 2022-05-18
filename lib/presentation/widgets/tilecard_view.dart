import 'package:flutter/material.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/presentation/fullview/fullview.dart';
import 'package:yts_app/presentation/widgets/card_view.dart';
import 'package:yts_app/presentation/widgets/main_titles.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final Color txtcolor;
  final List<Movie> movData;
  const TitleCard({
    Key? key,
    required this.title,
    required this.txtcolor,
    required this.movData,
  }) : super(key: key);

  final imageError =
      'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitles(
          title: title,
          txtColor: txtcolor,
          txtSize: 18,
        ),
        LimitedBox(
          maxHeight: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullDetailView(
                              // id: index,
                              dataList: movData[index],
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CardView(
                    image: movData[index].mediumCoverImage.toString(),
                  ),
                ),
              );
            },
          ),

          //  ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: List.generate(
          //         posterImage.length,
          //         (index) => Padding(
          //               padding: const EdgeInsets.all(5.0),
          //               child: CardView(
          //                 image:
          //                     posterImage[index].mediumCoverImage.toString(),
          //               ),
          //             )))
        )
      ],
    );
  }
}
