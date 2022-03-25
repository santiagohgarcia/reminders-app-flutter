import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:remindersapp/services/auth-service.dart';
import 'package:remindersapp/ui/not-found.dart';

import 'package:remindersapp/ui/sign-in.dart';
import 'package:remindersapp/ui/profile.dart';
import 'package:remindersapp/ui/reminders/reminder.dart';
import 'package:remindersapp/ui/reminders/reminders.dart';

class AppRouter {
  static FluroRouter router = FluroRouter();

  static void initializeRouter(navigatorKey) {
    //NOT-FOUND
    router.notFoundHandler =
        Handler(handlerFunc: (context, params) => const NotFoundScreen());
    //SIGN IN
    router.define('/', handler: Handler(
      handlerFunc: (context, _) {
        _userGateHandler(context);
        return const RemindersScreen();
      },
    ));
    //SIGN IN
    router.define(
      '/sign-in',
      handler: Handler(handlerFunc: (context, _) {
        AuthService().userStream.first.then((user) {
          if (user != null) {
            Navigator.of(context!).pushReplacementNamed('/reminders');
          }
        });
        return const SignInScreenLocal();
      }),
    );
    //PROFILE
    router.define(
      '/profile',
      handler: Handler(handlerFunc: (context, _) {
        _userGateHandler(context);
        return const ProfileScreenLocal();
      }),
    );
    //REMINDERS
    router.define(
      '/reminders',
      handler: Handler(handlerFunc: (context, _) {
        _userGateHandler(context);
        return const RemindersScreen();
      }),
    );
    //REMINDER
    router.define(
      '/reminder/:id',
      handler: Handler(
        handlerFunc: (context, params) {
          _userGateHandler(context);
          return ReminderScreen(params['id']![0]);
        },
      ),
    );
  }

  static _userGateHandler(context) {
    AuthService().userStream.first.then((user) {
      if (user == null) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.of(context!).pushReplacementNamed('/sign-in');
        });
      }
    });
  }
}
