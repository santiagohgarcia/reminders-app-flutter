
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/services/auth_service.dart';

final userProvider = StreamProvider.autoDispose<User?>(
    (ref) => AuthService().userStream);