import 'package:remindersapp/services/auth_service.dart';
import 'package:remindersapp/ui/not-found.dart';
import 'package:remindersapp/ui/profile.dart';
import 'package:remindersapp/ui/reminders/reminder.dart';
import 'package:remindersapp/ui/reminders/reminders.dart';
import 'package:remindersapp/ui/sign_in.dart';
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
        stackedRoutes: [ReminderRoute(), ProfileRoute()],
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
            return ReminderScreen(data.pathParameters['reminderId']);
          },
          name: name)
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
