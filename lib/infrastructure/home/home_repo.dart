import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:yts_app/domain/core/api_endpoints.dart';
import 'package:yts_app/domain/core/failures/main_failure.dart';
import 'package:yts_app/domain/home/ihome_repo.dart';
import 'package:yts_app/domain/home/model/data.dart';

@LazySingleton(as: IHomeRepo)
class HomeRepository implements IHomeRepo {
  @override
  Future<Either<MainFailure, Data>> getHome() async {
    try {
      final Response response = await Dio(BaseOptions())
          .get('https://yts.mx/api/v2/list_movies.json');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('!!!!!!!!!!!!!' + response.statusCode.toString());
        print(response.data);
        final jsonMdata = response.data['data'];
        final homeDataList = Data.fromJson(jsonMdata);
        return Right(homeDataList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
