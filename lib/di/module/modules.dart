import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class MyDioInject {

  Logger get logger{
    return Logger();
  }
}
