import 'package:dartz/dartz.dart';
import 'package:yts_app/domain/core/failures/main_failure.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/domain/search/model/data.dart';


abstract class AllitemsServices {
  Future<Either<MainFailure, SearchData>> nextPage({
    required int pageNo,
  });
}
