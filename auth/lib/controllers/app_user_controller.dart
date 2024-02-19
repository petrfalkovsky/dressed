import 'package:auth/utils/app_response.dart';
import 'package:conduit_core/conduit_core.dart';

class AppUserController extends ResourceController {
  final ManagedContext managedContext;

  AppUserController(this.managedContext);
  @Operation.get()
  Future<Response> getProfile() async {
    try {
      return AppResponse.ok(message: "Профиль получен");
    } catch (error) {
      return AppResponse.serverError(error);
    }
  }

  @Operation.post()
  Future<Response> updateProfile() async {
    try {
      return AppResponse.ok(message: "Профиль обновлен");
    } catch (error) {
      return AppResponse.serverError(error);
    }
  }

  @Operation.put()
  Future<Response> updatePassword() async {
    try {
      return AppResponse.ok(message: "Пароль обновлен");
    } catch (error) {
      return AppResponse.serverError(error);
    }
  }
}
