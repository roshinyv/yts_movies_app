import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts_app/application/search/search_bloc.dart';
import 'package:yts_app/core/colors/constant_colors.dart';
import 'package:yts_app/presentation/fullview/fullview.dart';
import 'package:yts_app/presentation/widgets/card_view.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(const Initialize());
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kGoldenColor,
              ),
            );
          } else if (state.isError) {
            return Center(
              child: Image.asset(
                "assets/images/error_gif.gif",
                height: 125,
                width: 125,
              ),

              // Text(
              //   'Error Data',
              //   style: TextStyle(color: kWhiteColor),
              // ),
            );
          } else if (state.idleList.isEmpty) {
            return const Center(
              child: Text(
                'List is Empty',
                style: TextStyle(color: kWhiteColor),
              ),
            );
          }
          return GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: state.idleList.length,
              itemBuilder: (BuildContext ctx, index) {
                final movie = state.idleList[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullDetailView(
                                  // id: index,
                                  dataList: state.idleList[index],
                                )),
                      );
                    },
                    child: CardView(image: movie.mediumCoverImage.toString()));
              });
        },
      ),
    );
  }
}
