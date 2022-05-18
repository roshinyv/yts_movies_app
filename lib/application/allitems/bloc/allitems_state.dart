part of 'allitems_bloc.dart';

@freezed
class AllitemsState with _$AllitemsState {
  const factory AllitemsState({
    required List<SearchResultMovies> movieList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory AllitemsState.initial() =>  const AllitemsState(
        movieList: [],
        isLoading: false,
        isError: false,
      );
}
