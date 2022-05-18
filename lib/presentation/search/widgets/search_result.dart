import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts_app/application/search/search_bloc.dart';
import 'package:yts_app/presentation/fullview/search_result_fullview.dart';
import 'package:yts_app/presentation/widgets/card_view.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
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
            itemCount: state.searchResultList.length,
            itemBuilder: (BuildContext ctx, index) {
              final movie = state.searchResultList[index];
              // print('++++++' + movie.posterPath.toString());
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchFullView(
                                // id: index,
                                dataList: state.searchResultList[index],
                              )),
                    );
                  },
                  child: CardView(image: movie.mediumCoverImage.toString()));
            });
      }),
    );
  }
}
