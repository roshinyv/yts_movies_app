import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts_app/application/search/search_bloc.dart';
import 'package:yts_app/core/colors/constant_colors.dart';
import 'package:yts_app/domain/core/debounce/debounce.dart';
import 'package:yts_app/presentation/search/widgets/search_idle.dart';
import 'package:yts_app/presentation/search/widgets/search_result.dart';
import 'package:yts_app/presentation/widgets/main_titles.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

final _debouncer = Debouncer(milliseconds: 1 * 1000);

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      // bottomNavigationBar: const CustomBottomBar(),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 1.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  // IconButton(
                  //   icon: const Icon(
                  //     Icons.arrow_back,
                  //     color: Colors.black,
                  //   ),
                  //   onPressed: () {
                  //     print("your menu action here");
                  //   },
                  // ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Type your search here",
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        // BlocProvider.of<SearchBloc>(context)
                        //       .add(SearchMovie(movieQuery: value));
                        if (value.isEmpty) {
                          return;
                        }
                        _debouncer.run(() {
                          BlocProvider.of<SearchBloc>(context)
                              .add(SearchMovie(movieQuery: value));
                        });
                      },
                    ),
                  ),
                  // IconButton(
                  //   icon: const Icon(
                  //     Icons.keyboard_voice_outlined,
                  //     color: Colors.black,
                  //   ),
                  //   onPressed: () {
                  //     print("your menu action here");
                  //   },
                  // ),
                ],
              ),
            ),
          ),
          Row(
            children: const [
              CustomTitles(
                title: "Today's Top Search",
                txtColor: kWhiteColor,
                txtSize: 18,
              ),
            ],
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              print(state.toString());
              if (state.searchResultList.isEmpty) {
                return const SearchIdle();
              } else {
                return const SearchResults();
              }
            },
          ),
        ],
      ),
    );
  }
}
