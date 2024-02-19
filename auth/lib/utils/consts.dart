import 'dart:io';

abstract class AppConsts {
  AppConsts._();

  static final String secretKey =
      Platform.environment["SECRET_KEY"] ?? "SECRET_KEY";
}
