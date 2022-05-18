import 'package:dartz/dartz.dart';
import 'package:yts_app/domain/core/failures/main_failure.dart';
import 'package:yts_app/domain/home/model/data.dart';

abstract class IHomeRepo {
  Future<Either<MainFailure, Data>> getHome();
}
