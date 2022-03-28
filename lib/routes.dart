import 'package:remindersapp/features/reminders/reminders_screen.dart';
import 'package:remindersapp/services/auth_service.dart';
import 'package:remindersapp/features/not_found/not_found_screen.dart';
import 'package:remindersapp/features/profile/profile_screen.dart';
import 'package:remindersapp/features/reminder/reminder_screen.dart';
import 'package:remindersapp/features/sign_in/sign_in_screen.dart';
import 'package:vrouter/vrouter.dart';

final routes = [
  SignInRoute(),
  GuardedRoutes(),
  VRouteRedirector(path: '*', redirectTo: '/not-found')
];

class GuardedRoutes extends VRouteElementBuilder {
  @override
  List<VRouteElement> buildRoutes() {
    return [
      VGuard(
        beforeEnter: (vRedirector) async {
          final user = await AuthService().userStream.first;
          return user == null ? vRedirector.to(SignInRoute.path) : null;
        },
        stackedRoutes: [
          RemindersRoute(),
          NotFoundRoute(),
        ],
      ),
    ];
  }
}

class RemindersRoute extends VRouteElementBuilder {
  static String path = '/reminders';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(
        path: path,
        widget: const RemindersScreen(),
        stackedRoutes: [ReminderRoute(), ProfileRoute(), NewReminderRoute()],
      )
    ];
  }
}

class ReminderRoute extends VRouteElementBuilder {
  static String path = '/reminder/:reminderId';
  static String name = 'reminder';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget.builder(
          path: path,
          builder: (context, data) {
            return ReminderScreen(data.pathParameters['reminderId']!);
          },
          name: name)
    ];
  }
}

class NewReminderRoute extends VRouteElementBuilder {
  static String path = '/newReminder';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(
        path: path,
        widget: ReminderScreen(null),
      )
    ];
  }
}

class ProfileRoute extends VRouteElementBuilder {
  static String path = '/profile';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(path: path, widget: const ProfileScreenLocal()),
    ];
  }
}

class SignInRoute extends VRouteElementBuilder {
  static String path = '/sign-in';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VGuard(
        beforeEnter: (vRedirector) async {
          final user = await AuthService().userStream.first;
          return user != null ? vRedirector.to(RemindersRoute.path) : null;
        },
        stackedRoutes: [
          VWidget(path: path, widget: const SignInScreenLocal()),
        ],
      ),
    ];
  }
}

class NotFoundRoute extends VRouteElementBuilder {
  static String path = '/not-found';

  @override
  List<VRouteElement> buildRoutes() {
    return [VWidget(path: path, widget: const NotFoundScreen())];
  }
}
