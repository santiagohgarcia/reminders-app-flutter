import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/routes.dart';
import 'package:remindersapp/theme.dart';
import 'package:vrouter/vrouter.dart';
import 'firebase_options.dart';
import 'routes.dart';

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
    //Initialize Router

    //Material app
    return VRouter(
      debugShowCheckedModeBanner: false,
      initialUrl: '/reminders',
      routes: routes,
      theme: appTheme,
    );
    // return MaterialApp(
    //     navigatorKey: navigatorKey,
    //     onGenerateRoute: AppRouter.router.generator,
    //     theme: appTheme,
    //   );
  }
}
