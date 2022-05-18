import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts_app/application/allitems/bloc/allitems_bloc.dart';
import 'package:yts_app/core/colors/constant_colors.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/domain/search/model/data.dart';
import 'package:yts_app/presentation/fullview/search_result_fullview.dart';
import 'package:yts_app/presentation/widgets/card_view.dart';
import 'package:yts_app/presentation/widgets/main_titles.dart';

class AllItemsList extends StatefulWidget {
  const AllItemsList({Key? key}) : super(key: key);

  @override
  State<AllItemsList> createState() => _AllItemsListState();
}

class _AllItemsListState extends State<AllItemsList> {
  final List<SearchResultMovies> _movieUpdatedList = [];
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // int pageno = 8;
    BlocProvider.of<AllitemsBloc>(context).add(AllitemsEvent.nextPage());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: BlocConsumer<AllitemsBloc, AllitemsState>(
          listener: (context, state) {
            print('((((((((((((Allitems)))))))))' + state.toString());

            if (state.isLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text(
                  'isloading',
                  style: TextStyle(color: kWhiteColor),
                )),
              );
            }
            // else if (state.movieList.isNotEmpty) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('No more data')),
            //   );
            // }
            else if (state.isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('134error')),
              );
              // context.bloc<AllitemsBloc>().isFetching = false;
              BlocProvider.of<AllitemsBloc>(context).isFetching = false;
            }
            return;
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            } else if (state.movieList.isNotEmpty) {
              _movieUpdatedList.addAll(state.movieList);
              BlocProvider.of<AllitemsBloc>(context).isFetching = false;
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            } else if (state.isError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AllitemsBloc>(context)
                        ..isFetching = true
                        ..add(const AllitemsEvent.nextPage());
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text('error123567', textAlign: TextAlign.center),
                ],
              );
            }
            return ListView(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent &&
                      !BlocProvider.of<AllitemsBloc>(context).isFetching) {
                    BlocProvider.of<AllitemsBloc>(context)
                      ..isFetching = true
                      ..add(const AllitemsEvent.nextPage());
                    // ..add(AllitemsEvent());
                  }
                }),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomTitles(
                          title: "All Movies",
                          txtColor: kWhiteColor,
                          txtSize: 18),
                    ),
                  ],
                ),
                GridView.builder(
                    // controller: _scrollController
                    //   ..addListener(() {
                    //     if (_scrollController.offset ==
                    //             _scrollController.position.maxScrollExtent &&
                    //         !BlocProvider.of<AllitemsBloc>(context)
                    //             .isFetching) {
                    //       BlocProvider.of<AllitemsBloc>(context)
                    //         ..isFetching = true
                    //         ..add(const AllitemsEvent.nextPage());
                    //       // ..add(AllitemsEvent());
                    //     }
                    //   }),
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: _movieUpdatedList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      print('++++++++++listlength' +
                          _movieUpdatedList.length.toString());
                      final movie = _movieUpdatedList[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchFullView(
                                  dataList: movie,
                                ),
                              ),
                            );
                          },
                          child: CardView(
                              image: movie.mediumCoverImage.toString()));
                    }),
              ],
            );
          },

          //   {
          //   return GridView.builder(
          //       scrollDirection: Axis.vertical,
          //       physics: const NeverScrollableScrollPhysics(),
          //       shrinkWrap: true,
          //       gridDelegate:
          //           const SliverGridDelegateWithMaxCrossAxisExtent(
          //         maxCrossAxisExtent: 150,
          //         childAspectRatio: 3 / 4,
          //         crossAxisSpacing: 5,
          //         mainAxisSpacing: 5,
          //       ),
          //       itemCount: state.movieList.length,
          //       itemBuilder: (BuildContext ctx, index) {
          //         final movie = state.movieList[index];
          //         return CardView(
          //             image: '$imageAppendUrl${movie.posterPath}');
          //       });
          // },
          // ),

          // BlocBuilder<AllitemsBloc, AllitemsState>(
          //   builder: (context, state) {
          //     print('=====================blocstate' + state.toString());
          //     if (state.isLoading) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else if (state.isError) {
          //       return const Center(
          //         child: Text(
          //           'Error Data',
          //           style: TextStyle(color: kWhiteColor),
          //         ),
          //       );
          //     }
          //     return GridView.builder(
          //         scrollDirection: Axis.vertical,
          //         physics: const NeverScrollableScrollPhysics(),
          //         shrinkWrap: true,
          //         gridDelegate:
          //             const SliverGridDelegateWithMaxCrossAxisExtent(
          //           maxCrossAxisExtent: 150,
          //           childAspectRatio: 3 / 4,
          //           crossAxisSpacing: 5,
          //           mainAxisSpacing: 5,
          //         ),
          //         itemCount: state.movieList.length,
          //         itemBuilder: (BuildContext ctx, index) {
          //           final movie = state.movieList[index];
          //           return CardView(
          //               image: '$imageAppendUrl${movie.posterPath}');
          //         });
          //   },
          // ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
