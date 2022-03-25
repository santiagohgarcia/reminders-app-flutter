import 'package:remindersapp/services/auth-service.dart';
import 'package:remindersapp/ui/not-found.dart';
import 'package:remindersapp/ui/profile.dart';
import 'package:remindersapp/ui/reminders/reminder.dart';
import 'package:remindersapp/ui/reminders/reminders.dart';
import 'package:remindersapp/ui/sign-in.dart';
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
          return user == null ? vRedirector.to(SignInRoute.signIn) : null;
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
  static String reminders = '/reminders';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(path: reminders, widget: const RemindersScreen(), stackedRoutes: [
        VWidget(
            path: ':reminderId',
            widget: const ReminderScreen(),
            name: 'reminder'),
         ProfileRoute()
      ])
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
  static String signIn = '/sign-in';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VGuard(
        beforeEnter: (vRedirector) async {
          final user = await AuthService().userStream.first;
          return user != null ? vRedirector.to(RemindersRoute.reminders) : null;
        },
        stackedRoutes: [
          VWidget(path: signIn, widget: const SignInScreenLocal()),
        ],
      ),
    ];
  }
}

class NotFoundRoute extends VRouteElementBuilder {
  static String notFound = '/not-found';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VGuard(
        beforeEnter: _signInRedirector,
        stackedRoutes: [
          VWidget(path: notFound, widget: const NotFoundScreen()),
        ],
      ),
    ];
  }
}

Future<void> _signInRedirector(VRedirector vRedirector) async {
  final user = await AuthService().userStream.first;
  return user == null ? vRedirector.to(SignInRoute.signIn) : null;
}
