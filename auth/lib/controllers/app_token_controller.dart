import 'dart:async';
import 'dart:io';

import 'package:auth/controllers/app_auth_controller.dart';
import 'package:auth/utils/app_response.dart';
import 'package:auth/utils/consts.dart';
import 'package:conduit_core/conduit_core.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class AppAuthController extends Controller {
  @override
  FutureOr<RequestOrResponse?> handle(Request request) {
    try {
      final key = AppConsts.secretKey;
      final header = request.raw.headers.value(HttpHeaders.authorizationHeader);
      final token = AuthorizationBearerParser().parse(header);
      final JwtClaim = verifyJwtHS256Signature(token ?? '', key);
      JwtClaim.validate();
      return request;
    } catch (error) {
      return AppResponse.serverError(error);
    }
  }
}
