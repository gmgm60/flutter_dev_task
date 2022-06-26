import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class MyDioInject {
  Dio get dio {
    Dio dio = Dio();
    dio.options.headers = {
      "Accept":"application/json"
    };
    return dio;
  }

  Logger get logger{
    return Logger();
  }
}
