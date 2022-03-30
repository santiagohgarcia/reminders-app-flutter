// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

const seed = Color(0xFF6750A4);

const lightColorScheme = ColorScheme(
	brightness: Brightness.light,
	primary : Color(0xFF4159A9),
	onPrimary : Color(0xFFFFFFFF),
	primaryContainer : Color(0xFFDBE1FF),
	onPrimaryContainer : Color(0xFF001552),
	secondary : Color(0xFF005FAF),
	onSecondary : Color(0xFFFFFFFF),
	secondaryContainer : Color(0xFFD3E4FF),
	onSecondaryContainer : Color(0xFF001C3B),
	tertiary : Color(0xFF7F5700),
	onTertiary : Color(0xFFFFFFFF),
	tertiaryContainer : Color(0xFFFFDEA9),
	onTertiaryContainer : Color(0xFF281900),
	error : Color(0xFFB3261E),
	errorContainer : Color(0xFFF9DEDC),
	onError : Color(0xFFFFFFFF),
	onErrorContainer : Color(0xFF410E0B),
	background : Color(0xFFFDFCFF),
	onBackground : Color(0xFF1B1B1B),
	surface : Color(0xFFFDFCFF),
	onSurface : Color(0xFF1B1B1B),
	surfaceVariant : Color(0xFFE7E0EC),
	onSurfaceVariant : Color(0xFF49454F),
	outline : Color(0xFF79747E),
	onInverseSurface : Color(0xFFF1F0F3),
	inverseSurface : Color(0xFF2F3033),
	inversePrimary : Color(0xFFB4C4FF),
	shadow : Color(0xFF000000),
);

var appLightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme
);

const darkColorScheme = ColorScheme(
	brightness: Brightness.dark,
	primary : Color(0xFFB4C4FF),
	onPrimary : Color(0xFF092979),
	primaryContainer : Color(0xFF284190),
	onPrimaryContainer : Color(0xFFDBE1FF),
	secondary : Color(0xFFA3C9FF),
	onSecondary : Color(0xFF00315F),
	secondaryContainer : Color(0xFF004785),
	onSecondaryContainer : Color(0xFFD3E4FF),
	tertiary : Color(0xFFFFBA2C),
	onTertiary : Color(0xFF432C00),
	tertiaryContainer : Color(0xFF604100),
	onTertiaryContainer : Color(0xFFFFDEA9),
	error : Color(0xFFF2B8B5),
	errorContainer : Color(0xFF8C1D18),
	onError : Color(0xFF601410),
	onErrorContainer : Color(0xFFF9DEDC),
	background : Color(0xFF1B1B1B),
	onBackground : Color(0xFFE2E2E6),
	surface : Color(0xFF1B1B1B),
	onSurface : Color(0xFFE2E2E6),
	surfaceVariant : Color(0xFF49454F),
	onSurfaceVariant : Color(0xFFCAC4D0),
	outline : Color(0xFF938F99),
	onInverseSurface : Color(0xFF1B1B1B),
	inverseSurface : Color(0xFFE2E2E6),
	inversePrimary : Color(0xFF4159A9),
	shadow : Color(0xFF000000),
);

var appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme
);