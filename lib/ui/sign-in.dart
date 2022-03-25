import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:remindersapp/app-router.dart';

class SignInScreenLocal extends StatelessWidget {
  const SignInScreenLocal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      sideBuilder: (context, _) {
        return const Center(
          child: FlutterLogo(size: 400 ),
        );
      },
      headerBuilder: (context, constraints, _) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: FlutterLogo(),
          ),
        );
      },
      providerConfigs: const [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(
          clientId:
              '487970241362-9bn2kk224n1bqrsjr342hnd6k530li3p.apps.googleusercontent.com',
        ),
      ],
      actions: [
        AuthStateChangeAction<SignedIn>((context, _) {
          AppRouter.router.navigateTo(context, '/reminders');
        }),
      ],
    );
  }
}
