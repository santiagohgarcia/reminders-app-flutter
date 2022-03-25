import 'package:remindersapp/ui/sign-in.dart';
import 'package:remindersapp/ui/profile.dart';
import 'package:remindersapp/ui/reminders/reminder.dart';
import 'package:remindersapp/ui/reminders/reminders.dart';

var appRoutes = {
  '/sign-in': (context) => const SignInScreenLocal(),
  '/profile': (context) => const ProfileScreenLocal(),
  '/reminders': (context) => const RemindersScreen(),
  '/reminder': (context) => const ReminderScreen()
};