part of 'moviesdatas_bloc.dart';

@freezed
class MoviesdataState with _$MoviesdataState {
  const factory MoviesdataState({
    required List<Movie> moviesList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory MoviesdataState.initial() => const MoviesdataState(
        moviesList: [],
        hasError: false,
        isLoading: false,
      );
}
