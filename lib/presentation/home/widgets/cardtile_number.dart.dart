// import 'package:flutter/material.dart';
// import 'package:yts_app/core/colors/constant_colors.dart';
// import 'package:yts_app/domain/home/movie_datas/data.dart';
// import 'package:yts_app/presentation/home/widgets/cardview_number.dart';
// import 'package:yts_app/presentation/widgets/main_titles.dart';

// class CardWithNo extends StatelessWidget {
//   final String title;
//   final Color txtcolor;
//   final List<Movie> img;
//   const CardWithNo(
//       {Key? key,
//       required this.title,
//       required this.txtcolor,
//       required this.img})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CustomTitles(
//           Title: title,
//           txtColor: kWhiteColor,
//         ),
//         LimitedBox(
//             maxHeight: 200,
//             child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(
//                     img.length,
//                     (index) => Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: CardViewWithNo(
//                             index: index,
//                             image: img[index].mediumCoverImage.toString(),
//                           ),
//                         )))),
//       ],
//     );
//   }
// }
