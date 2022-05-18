// import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/presentation/more/more.dart';

class BannerSlide extends StatelessWidget {
  final List<String> posterList;
  const BannerSlide({Key? key, required this.posterList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 650,
          child: CarouselSlider.builder(
              enableAutoSlider: true,
              unlimitedMode: true,
              slideBuilder: (index) {
                return ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.darken,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: posterList[index],
                          // placeholder: (context, url) =>
                          //     const Center(child: CircularProgressIndicator(),),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        // Image.network(
                        //     posterList[index].largeCoverImage.toString()
                        // '$imageAppendUrl${posterList[index].posterPath}'
                        // '$imageAppendUrl$posterPath[index]',
                        // fit: BoxFit.fill,
                        // ),
                        Container(
                          height: 30,
                          color: Colors.black,
                        )
                      ],
                    ));
              },
              slideTransform: const DefaultTransform(),
              slideIndicator: CircularWaveSlideIndicator(
                padding: const EdgeInsets.only(bottom: 10),
                currentIndicatorColor: Colors.white,
                indicatorBackgroundColor: Colors.white12,
              ),

              // CircularSlideIndicator(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   currentIndicatorColor: Colors.white,
              //   indicatorBackgroundColor: Colors.white12,
              //   // indicatorBorderWidth: 5,
              // ),
              itemCount: posterList.length),
        ),
        Positioned(
          bottom: 30,
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
                  child: Text("Play Now"),
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
