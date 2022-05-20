import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yts_app/domain/allitems/allitems_services.dart';
import 'package:yts_app/domain/core/failures/main_failure.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/domain/search/model/data.dart';

part 'allitems_event.dart';
part 'allitems_state.dart';
part 'allitems_bloc.freezed.dart';

@injectable
class AllitemsBloc extends Bloc<AllitemsEvent, AllitemsState> {
  final AllitemsServices _allitemsServices;
  int page = 1;
  bool isFetching = false;

  AllitemsBloc(this._allitemsServices) : super(AllitemsState.initial()) {
    on<_NextPage>((event, emit) async {
      if (state.movieList.isNotEmpty) {
        emit(
          AllitemsState(
              movieList: state.movieList, isLoading: false, isError: false),
        );
      }
      final result = await _allitemsServices.nextPage(pageNo: page);
      final _state = result.fold(
        (MainFailure fail) {
          return const AllitemsState(
            movieList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchData mov) {
          page++;
          return AllitemsState(
            movieList: mov.movies!,
            isLoading: false,
            isError: false,
          );
        },
      );
      // page++;
      emit(_state);
    });
  }
}
