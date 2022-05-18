import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String image;
  const CardView({
    Key? key,
    required this.image,
  }) : super(key: key);

  // final imageError =
  //     'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   // color: Colors.green,
      //   // image: DecorationImage(
      //   //   fit: BoxFit.cover,
      //   //   image: NetworkImage(image),
      //   // ),
      // ),
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
    );
  }
}
