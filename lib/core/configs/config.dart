import 'package:sf_jrw/core/utils/enums.dart';

abstract class AppConfig {
  BuildEnv get env;
  String get baseUrl;
  String get graphUrl;
  int get otpDelay;
  String get localGraphCacheBox;
  String get localStorageGroupId;
}