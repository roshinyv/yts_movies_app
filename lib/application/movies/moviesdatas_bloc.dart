import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yts_app/domain/core/failures/main_failure.dart';
import 'package:yts_app/domain/home/ihome_repo.dart';
import 'package:yts_app/domain/home/model/data.dart';

part 'moviesdatas_event.dart';
part 'moviesdatas_state.dart';
part 'moviesdatas_bloc.freezed.dart';

@injectable
class MoviesdatasBloc extends Bloc<MoviesdataEvent, MoviesdataState> {
  final IHomeRepo _homeRepository;
  MoviesdatasBloc(this._homeRepository) : super(MoviesdataState.initial()) {
    on<GetHomeData>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        hasError: false,
      ));
      final moviesResult = await _homeRepository.getHome();
      final state1 = moviesResult.fold(
        (MainFailure failure) {
          log(failure.toString());
          return const MoviesdataState(
            moviesList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (Data mov) {
          final movieData = mov.movies;
          return MoviesdataState(
            moviesList: movieData!,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(state1);
    });
  }
}
