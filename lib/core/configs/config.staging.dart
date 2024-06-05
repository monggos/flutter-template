import 'package:sf_jrw/core/configs/config.dart';
import 'package:sf_jrw/core/utils/enums.dart';

class StagingAppConfig implements AppConfig {
  @override
  BuildEnv get env => BuildEnv.STAGING;

  @override
  String get baseUrl => 'http://staging-url';

  @override
  String get graphUrl => 'http://staging-url/graphql';
  
  @override
  int get otpDelay => 60;

  @override
  String get localGraphCacheBox => 'staging-GraPH-2024';

  @override
  String get localStorageGroupId => 'staging@2024';
}