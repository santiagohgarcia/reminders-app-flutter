// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:remindersapp/main.dart';

void main() {
  final tUser = MockUser(
    isAnonymous: false,
    uid: 'T3STU1D',
    email: 'bob@thebuilder.com',
    displayName: 'Bob Builder',
    phoneNumber: '0800 I CAN FIX IT',
    photoURL: 'http://photos.url/bobbie.jpg',
    refreshToken: 'some_long_token',
  );
  testWidgets('App Loads', (WidgetTester tester) async {
  //Ensure initialized
  WidgetsFlutterBinding.ensureInitialized();
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: App()));

    //Expect to find header with title
    //expect(find.text('Sign In'), findsOneWidget);
    //expect(find.byType(FlutterLogo), findsOneWidget);
    expect(find.byType(App), findsOneWidget);
  });
}
