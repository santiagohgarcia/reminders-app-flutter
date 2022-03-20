import 'package:remindersapp/about.dart';
//import 'package:quizapp/profile/profile.dart';
//import 'package:quizapp/login/login.dart';
//import 'package:quizapp/topics/topics.dart';
import 'package:remindersapp/home.dart';
import 'package:remindersapp/ui/login.dart';
import 'package:remindersapp/ui/reminder.dart';
import 'package:remindersapp/ui/reminders.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/reminders': (context) => const RemindersScreen(),
  '/reminder': (context) => const ReminderScreen(),
  '/about': (context) => const AboutScreen(),
};