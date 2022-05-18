import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:yts_app/domain/core/api_endpoints.dart';
import 'package:yts_app/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/domain/search/model/data.dart';
import 'package:yts_app/domain/search/search_services.dart';

@LazySingleton(as: SearchServices)
class SearchRepo implements SearchServices {
  @override
  Future<Either<MainFailure, SearchData>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query_term': movieQuery,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final resultData = response.data['data'];
        print('+++++++++++++++++++++++++++++'+resultData.toString());
        final resultResult = SearchData.fromJson(resultData);
        return Right(resultResult);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return left(const MainFailure.clientFailure());
    }
  }
}
