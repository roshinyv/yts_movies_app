part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SearchResultMovies> searchResultList,
    required List<Movie> idleList,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: false,
        isError: false,
      );
}
