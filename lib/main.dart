import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/routes.dart';
import 'package:remindersapp/services/auth-service.dart';
import 'package:remindersapp/shared/error.dart';
import 'package:remindersapp/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    final user = ref.watch(userProvider);

    return user.when(
      data: (user) => MaterialApp(
          initialRoute: user == null ? '/sign-in' : '/reminders',
          routes: appRoutes,
          theme: appTheme),
      error: (e, s) => ErrorScreen(e, s),
      loading: () => const Text(
        'loading',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
