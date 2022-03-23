import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class ProfileScreenLocal extends StatelessWidget {
  const ProfileScreenLocal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      providerConfigs: const [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(
          clientId:
              '487970241362-9bn2kk224n1bqrsjr342hnd6k530li3p.apps.googleusercontent.com',
        )
      ],
      actions: [
        SignedOutAction((context) {
          Navigator.of(context).pushReplacementNamed('/sign-in');
        }),
      ],
      avatarSize: 250,
    );
  }
}
