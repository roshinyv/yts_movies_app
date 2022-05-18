import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yts_app/domain/core/failures/main_failure.dart';
import 'package:yts_app/domain/home/ihome_repo.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/domain/search/model/data.dart';
import 'package:yts_app/domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IHomeRepo _ihomeRepo;
  final SearchServices _searchService;
  SearchBloc(this._ihomeRepo, this._searchService)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
              searchResultList: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false),
        );
        return;
      }
      emit(
        const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false),
      );

      final result = await _ihomeRepo.getHome();
      final _state = result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (Data mov) {
          return SearchState(
              searchResultList: [],
              idleList: mov.movies!,
              isLoading: false,
              isError: false);
        },
      );
      emit(_state);
    });

    on<SearchMovie>((event, emit) async {
      log('search for ${event.movieQuery}');
      emit(
        const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false),
      );
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      print('=============result=========='+_result.toString());
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchData result) {
          return SearchState(
            searchResultList: result.movies!,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });
  }
}
