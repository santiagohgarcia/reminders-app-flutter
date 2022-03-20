import 'package:flutter/material.dart';
import 'package:remindersapp/ui/login.dart';
import 'package:remindersapp/services/auth-service.dart';
import 'package:remindersapp/ui/reminders.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, userSnapshot) {
          //If no login data, show login screen
          if (!userSnapshot.hasData) {
            return const LoginScreen();
            //else, show Reminders screen
          } else {
            return const RemindersScreen();
          }
        });
  }
}
