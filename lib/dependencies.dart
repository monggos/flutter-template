import 'package:get_it/get_it.dart';

final locator = GetIt.I;

Future<void> injectDependencies() async {
  //-------------------------- build environment ----------------------->>>
  if (Platform.isAndroid) {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final package = packageInfo.packageName;

    // app config..
    if      (package == 'ph.sf-jrw.dev')      { locator.registerLazySingleton<AppConfig>(() => DevAppConfig()); }
    else if (package == 'ph.sf-jrw.staging')  { locator.registerLazySingleton<AppConfig>(() => StagingAppConfig()); }
    else if (package == 'ph.sf-jrw')          { locator.registerLazySingleton<AppConfig>(() => ProdAppConfig()); }
    else                                      { locator.registerLazySingleton<AppConfig>(() => DevAppConfig()); }
    
  } else if (Platform.isIOS) {
    locator.registerLazySingleton<AppConfig>(() => DevAppConfig());
  }

  //-------------------------- stacked -------------------------------->>>
  setupLocator();
  setupDialogUi();
  // setupBottomSheetUi();

  //-------------------------- core ------------------------------------>>>
  locator.registerLazySingleton<SecureLocalStorage>(() => SecureLocalStorageImpl(config: locator()));
  locator.registerLazySingleton<GraphClient>(() => GraphClientImpl(config: locator()));

  //-------------------------- datasources ----------------------------->>>
  locator.registerLazySingleton<SecureLocalDataSource>(() => SecureLocalDataSourceImpl(storage: locator()));
  locator.registerLazySingleton<GraphDataSource>(() => GraphDataSourceImpl(client: locator()));

  //-------------------------- repositories ---------------------------->>>
  locator.registerLazySingleton<SecureLocalRepository>(() => SecureLocalRepositoryImpl(local: locator()));
  locator.registerLazySingleton<GraphRepository>(() => GraphRepositoryImpl(graph: locator())); locator()));

  //-------------------------- usecases -------------------------------->>>
  locator.registerLazySingleton(() => SystemInfoUseCase(repo: locator()));
  locator.registerLazySingleton(() => AuthBiometricUseCase(repo: locator()));
  locator.registerLazySingleton(() => GetLocalTokenUseCase(repo: locator()));
  locator.registerLazySingleton(() => SaveLocalTokenUseCase(repo: locator()));
  locator.registerLazySingleton(() => RemoveLocalTokenUseCase(repo: locator()));
}