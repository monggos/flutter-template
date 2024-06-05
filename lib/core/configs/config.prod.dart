import 'package:sf_jrw/core/configs/config.dart';
import 'package:sf_jrw/core/utils/enums.dart';

class ProdAppConfig implements AppConfig {
  @override
  BuildEnv get env => BuildEnv.PROD;

  @override
  String get baseUrl => 'http://production-url';

  @override
  String get graphUrl => 'http://production-url/graphql';
  
  @override
  int get otpDelay => 120;

  @override
  String get localGraphCacheBox => 'prod-GraPH2024';

  @override
  String get localStorageGroupId => 'prod-s3Cr3t@2024';
}