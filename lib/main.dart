import 'package:flutter/material.dart';
import 'package:sf_jrw/dependencies.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp(options: FirebaseOptions());
  await injectDependencies();
  
  // we can check/save the selected theme..
  ThemeMode theme = ThemeMode.light;
  
  runApp(App(theme: theme));
}

class App extends StatelessWidget {
  final ThemeMode theme;
  const App({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      themeMode: theme,
      theme: AppThemeHelper.baseThemeData,
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorObservers: [StackedService.routeObserver],
      localizationsDelegates: const [ FormBuilderLocalizations.delegate ],
    );
  }
}