import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:yts_app/domain/allitems/allitems_services.dart';
import 'package:yts_app/domain/core/api_endpoints.dart';
import 'package:yts_app/domain/core/failures/main_failure.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/domain/search/model/data.dart';

@LazySingleton(as: AllitemsServices)
class AllitemsRepo extends AllitemsServices {
  @override
  Future<Either<MainFailure, SearchData>> nextPage({required int pageNo}) async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'page': pageNo,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final resultData = response.data['results'];
        print('===================response' + response.data.toString());
        final jsonMdata = response.data['data'];
        final result = SearchData.fromJson(jsonMdata);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
