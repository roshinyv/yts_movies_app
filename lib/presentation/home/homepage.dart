import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts_app/application/movies/moviesdatas_bloc.dart';
import 'package:yts_app/core/colors/constant_colors.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/presentation/fullview/fullview.dart';
import 'package:yts_app/presentation/home/widgets/banner_slide.dart';
import 'package:yts_app/presentation/home/widgets/cardview_number.dart';
import 'package:yts_app/presentation/widgets/appbar_widget.dart';
import 'package:yts_app/presentation/widgets/main_titles.dart';
import 'package:yts_app/presentation/widgets/tilecard_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<MoviesdatasBloc>(context).add(const GetHomeData());
    });
    print('==========Homepage=========');
    // BlocProvider.of<MoviesdatasBloc>(context).add(const GetHomeData());
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: BlocBuilder<MoviesdatasBloc, MoviesdataState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: kGoldenColor,
            ));
          } else if (state.hasError) {
            return Center(
              child: Image.asset(
                "assets/images/error_gif.gif",
                height: 125,
                width: 125,
              ),
            );
          }
          final _bannerTrending = state.moviesList
              .map((m) {
                return '${m.largeCoverImage}';
              })
              .take(6)
              .toList();
          _bannerTrending.shuffle();

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    BannerSlide(
                      posterList: _bannerTrending,
                    ),
                    const CustomAppbar(),
                  ],
                ),
                TileWithNumber(
                  posterList: state.moviesList,
                ),
                TitleCard(
                  title: "Top Rated Movies",
                  txtcolor: kWhiteColor,
                  movData: state.topratedmovies,
                ),
                TitleCard(
                  title: "4K Movies",
                  txtcolor: kWhiteColor,
                  movData: state.hdmovies,
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class TileWithNumber extends StatelessWidget {
  const TileWithNumber({
    Key? key,
    required this.posterList,
  }) : super(key: key);

  final List<Movie> posterList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTitles(
          title: "Today's Hot Picks",
          txtColor: kWhiteColor,
          txtSize: 18,
        ),
        LimitedBox(
            maxHeight: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: posterList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullDetailView(
                                  // id: index,
                                  dataList: posterList[index],
                                )),
                      );
                    },
                    child: CardViewWithNo(
                      // image:
                      //     '$imageAppendUrl${posterList[index].posterPath}',
                      index: index,
                      image: posterList[index].mediumCoverImage.toString(),
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
