part of 'moviesdatas_bloc.dart';

@freezed
class MoviesdataState with _$MoviesdataState {
  const factory MoviesdataState({
    required String stateId,
    required List<Movie> moviesList,
    required List<Movie> hdmovies,
    required List<Movie> topratedmovies,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory MoviesdataState.initial() => const MoviesdataState(
        stateId: '0',
        moviesList: [],
        hdmovies: [],
        topratedmovies: [],
        hasError: false,
        isLoading: false,
      );
}
