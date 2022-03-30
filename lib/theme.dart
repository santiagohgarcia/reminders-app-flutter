import 'package:flutter/material.dart';

const seed = Color(0xFF576AC9);

const lightColorScheme = ColorScheme(
	brightness: Brightness.light,
	primary : Color(0xFF4356B4),
	onPrimary : Color(0xFFFFFFFF),
	primaryContainer : Color(0xFFDDE1FF),
	onPrimaryContainer : Color(0xFF000F5C),
	secondary : Color(0xFF5A5D72),
	onSecondary : Color(0xFFFFFFFF),
	secondaryContainer : Color(0xFFDFE1F9),
	onSecondaryContainer : Color(0xFF171A2C),
	tertiary : Color(0xFF76536D),
	onTertiary : Color(0xFFFFFFFF),
	tertiaryContainer : Color(0xFFFFD6F4),
	onTertiaryContainer : Color(0xFF2D1228),
	error : Color(0xFFBA1B1B),
	errorContainer : Color(0xFFFFDAD4),
	onError : Color(0xFFFFFFFF),
	onErrorContainer : Color(0xFF410001),
	background : Color(0xFFFEFBFF),
	onBackground : Color(0xFF1B1B1F),
	surface : Color(0xFFFEFBFF),
	onSurface : Color(0xFF1B1B1F),
	surfaceVariant : Color(0xFFE2E1EC),
	onSurfaceVariant : Color(0xFF45464F),
	outline : Color(0xFF76767F),
	onInverseSurface : Color(0xFFF3F0F5),
	inverseSurface : Color(0xFF303034),
	inversePrimary : Color(0xFFB8C3FF),
	shadow : Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
	brightness: Brightness.dark,
	primary : Color(0xFFB8C3FF),
	onPrimary : Color(0xFF092485),
	primaryContainer : Color(0xFF293D9B),
	onPrimaryContainer : Color(0xFFDDE1FF),
	secondary : Color(0xFFC3C5DD),
	onSecondary : Color(0xFF2C2F41),
	secondaryContainer : Color(0xFF43465A),
	onSecondaryContainer : Color(0xFFDFE1F9),
	tertiary : Color(0xFFE5BAD8),
	onTertiary : Color(0xFF44273E),
	tertiaryContainer : Color(0xFF5D3C55),
	onTertiaryContainer : Color(0xFFFFD6F4),
	error : Color(0xFFFFB4A9),
	errorContainer : Color(0xFF930006),
	onError : Color(0xFF680003),
	onErrorContainer : Color(0xFFFFDAD4),
	background : Color(0xFF1B1B1F),
	onBackground : Color(0xFFE4E1E6),
	surface : Color(0xFF1B1B1F),
	onSurface : Color(0xFFE4E1E6),
	surfaceVariant : Color(0xFF45464F),
	onSurfaceVariant : Color(0xFFC6C5D0),
	outline : Color(0xFF90909A),
	onInverseSurface : Color(0xFF1B1B1F),
	inverseSurface : Color(0xFFE4E1E6),
	inversePrimary : Color(0xFF4356B4),
	shadow : Color(0xFF000000),
);

var appLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.background
);


var appDarkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.background
);