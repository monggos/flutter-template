import 'package:sf_jrw/core/configs/config.dart';
import 'package:sf_jrw/core/utils/enums.dart';

class DevAppConfig implements AppConfig {
  @override
  BuildEnv get env => BuildEnv.DEV;

  @override
  String get baseUrl => 'http://localhost';

  @override
  String get graphUrl => 'http://localhost/graphql';
  
  @override
  int get otpDelay => 60;

  @override
  String get localGraphCacheBox => 'dev-GraPH2024';

  @override
  String get localStorageGroupId => 'dev-s3Cr3t@2024';
}