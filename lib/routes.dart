import 'package:remindersapp/about.dart';
import 'package:remindersapp/sign-in.dart';
import 'package:remindersapp/profile.dart';
import 'package:remindersapp/ui/reminder.dart';
import 'package:remindersapp/ui/reminders.dart';

var appRoutes = {
  '/sign-in': (context) => const SignInScreenLocal(),
  '/profile': (context) => const ProfileScreenLocal(),
  '/reminders': (context) => const RemindersScreen(),
  '/reminder': (context) => const ReminderScreen(),
  '/about': (context) => const AboutScreen(),
};