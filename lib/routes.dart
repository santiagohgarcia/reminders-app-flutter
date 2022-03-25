import 'package:remindersapp/services/auth-service.dart';
import 'package:remindersapp/ui/profile.dart';
import 'package:remindersapp/ui/reminders/reminder.dart';
import 'package:remindersapp/ui/reminders/reminders.dart';
import 'package:remindersapp/ui/sign-in.dart';
import 'package:vrouter/vrouter.dart';

final routes = [
  RemindersRoute(),
  ProfileRoute(),
  SignInRoute(),
];

class RemindersRoute extends VRouteElementBuilder {
  static String reminders = '/reminders';
  static String reminder = '/reminders/:reminderId';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VGuard(
        beforeEnter: _signInRedirector,
        stackedRoutes: [
          VWidget(path: reminders, widget: const RemindersScreen()),
          VWidget(path: reminder, widget: const ReminderScreen(), name: 'reminder'),
        ],
      ),
    ];
  }
}

class ProfileRoute extends VRouteElementBuilder {
  static String path = '/profile';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VGuard(
        beforeEnter: _signInRedirector,
        stackedRoutes: [
          VWidget(path: path, widget: const ProfileScreenLocal()),
        ],
      ),
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


Future<void> _signInRedirector(VRedirector vRedirector) async {
  final user = await AuthService().userStream.first;
  return user == null ? vRedirector.to(SignInRoute.signIn) : null;
}