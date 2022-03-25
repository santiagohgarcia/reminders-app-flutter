import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/theme.dart';
import 'firebase_options.dart';
import 'app-router.dart';

void main() async {
  //Ensure initialized
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Run Main App
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  //Initialize Router
  AppRouter.initializeRouter(navigatorKey);
  //Material app
  return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter.router.generator,
      theme: appTheme,
    );
  }
}
