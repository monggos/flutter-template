import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: HomeView),
    // @stacked-import
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-services
  ],
  dialogs: [
    StackedDialog(classType: ConfirmDialog),
    StackedDialog(classType: InfoDialog),
    StackedDialog(classType: ErrorDialog),
    StackedDialog(classType: LoadingDialog),
    StackedDialog(classType: CustomDialog),
    // @stacked-dialog
  ],
  bottomsheets: [
    StackedBottomsheet(classType: ConfirmSheet),
    // @stacked-bottom-sheet
  ],
)
class App {}