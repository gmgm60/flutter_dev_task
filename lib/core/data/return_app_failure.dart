import '../constants/strings.dart';
import '../domain/app_exception/app_exception.dart';
import '../domain/failures/app_failure.dart';

AppFailure returnAppFailure(appException) {
  if (appException is GeneralRemoteAppException) {
    return appException.map(
        unAuth: (e) => GeneralRemoteAppFailure.unAuth(message: e.message),
        noData: (e) => GeneralRemoteAppFailure.noData(message: e.message),
        noConnection: (e) =>
            GeneralRemoteAppFailure.noConnection(message: e.message),
        serverError: (e) =>
            GeneralRemoteAppFailure.serverError(message: e.message),
        unKnown: (e) => GeneralRemoteAppFailure.unKnown(message: e.message));
  } else {
    return GeneralRemoteAppFailure.unKnown(message: unknownError);
  }
}
