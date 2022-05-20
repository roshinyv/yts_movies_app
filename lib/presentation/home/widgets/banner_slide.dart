import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:yts_app/core/colors/constant_colors.dart';
import 'package:yts_app/presentation/more/more.dart';

class BannerSlide extends StatelessWidget {
  final List<String> posterList;
  const BannerSlide({Key? key, required this.posterList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 600,
          child: CarouselSlider.builder(
              enableAutoSlider: true,
              unlimitedMode: true,
              slideBuilder: (index) {
                return ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black],
                      ).createShader(
                          Rect.fromLTRB(100, 480, rect.width, rect.height * 1));
                    },
                    blendMode: BlendMode.darken,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: posterList[index],
                          // placeholder: (context, url) =>
                          //     const Center(child: CircularProgressIndicator(),),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    ));
              },
              slideTransform: const DefaultTransform(),
              slideIndicator: CircularWaveSlideIndicator(
                padding: const EdgeInsets.only(bottom: 5),
                currentIndicatorColor: Colors.white,
                indicatorBackgroundColor: Colors.white12,
              ),
              itemCount: posterList.length),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                // onTap: () {
                //   Navigator.of(context).push(
                //       MaterialPageRoute(builder: (context) => Fullview()));
                // },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.add,
                        size: 22,
                        color: Colors.white,
                      ),
                      Text(
                        'My List',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                height: 40.0,
                child: ElevatedButton(
                  child: const Text("Play Now"),
                  onPressed: () => print('object'),

                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => SearchPage())),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => More()));
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  // height: 50,
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.share,
                        size: 22,
                        color: Colors.white,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
