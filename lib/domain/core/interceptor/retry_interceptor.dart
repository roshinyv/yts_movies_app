// import 'dart:io';

// import 'package:dio/dio.dart';

// class RetryInterceptor extends Interceptor {
//    @override
//   Future onError(DioError err) async {
//     if (_shouldRetry(err)) {
//       try {
//         return requestRetrier.scheduleRequestRetry(err.request);
//       } catch (e) {
//         return e;
//       }
//     }
//     return err;
//   }

//   bool _shouldRetry(DioError err) {
//     return err.type == DioErrorType.other &&
//         err.error != null &&
//         err.error is SocketException;
//   }
// }