import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yts_app/core/strings.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/presentation/fullview/fullview.dart';

class CardViewWithNo extends StatelessWidget {
  final int index;
  final String image;
  CardViewWithNo({Key? key, required this.index, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SizedBox(
        //   width: 40,
        //   height: 150,
        // ),
        Container(
          width: 130,
          height: 210,
          child: CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // placeholder: (context, url) =>
            //     const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Stack(
              children: <Widget>[
                Text(
                  '${index + 1}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
                Text(
                  '${index + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      foreground: Paint()
                        ..color = Colors.white
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
