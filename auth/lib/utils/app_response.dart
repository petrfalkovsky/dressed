import 'package:auth/models/response_model.dart';
import 'package:conduit_core/conduit_core.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class AppResponse extends Response {
  AppResponse.serverError(dynamic error, {String? message})
      : super.serverError(body: _gerResponseModel(error, message));

  static AppResponseModel _gerResponseModel(error, String? message) {
    if (error == QueryException) {
      return AppResponseModel(
          error: error.toString(), message: message ?? error.message);
    }
    if (error == JwtException) {
      return AppResponseModel(
          error: error.toString(), message: message ?? error.message);
    }
    return AppResponseModel(
        error: error.toString(),
        message: message ?? "Какая-то неизвестная ошибка");
  }

  AppResponse.ok({dynamic body, String? message})
      : super.ok(AppResponseModel(data: body, message: message));
}
