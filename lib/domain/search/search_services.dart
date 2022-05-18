import 'package:dartz/dartz.dart';
import 'package:yts_app/domain/core/failures/main_failure.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/domain/search/model/data.dart';
import 'package:yts_app/infrastructure/search/search_repo.dart';

abstract class SearchServices {
  Future<Either<MainFailure, SearchData>> searchMovies({
    required String movieQuery,
  });
}
