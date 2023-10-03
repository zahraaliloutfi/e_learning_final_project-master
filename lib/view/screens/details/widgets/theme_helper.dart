import 'dart:ui';
import 'package:e_learning_final_project/view/screens/details/widgets/size_utils.dart';
import 'package:flutter/material.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.blueGray200,
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: appTheme.blueGray200,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF3D5CFF),
    primaryContainer: Color(0XFFFFFFFF),
    secondary: Color(0XFFFFFFFF),
    secondaryContainer: Color(0XFF3D5CFF),
    tertiary: Color(0XFFFFFFFF),
    tertiaryContainer: Color(0XFF3D5CFF),

    // Background colors
    background: Color(0XFFFFFFFF),

    // Surface colors
    surface: Color(0XFFFFFFFF),
    surfaceTint: Color(0XFFFFFFFF),
    surfaceVariant: Color(0XFF3D5CFF),

    // Error colors
    error: Color(0XFFFFFFFF),
    errorContainer: Color(0XFF3D5CFF),
    onError: Color(0XFF1F1F39),
    onErrorContainer: Color(0XFFFFFFFF),

    // On colors(text colors)
    onBackground: Color(0XFF1F1F39),
    onInverseSurface: Color(0XFF1F1F39),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0XFF1F1F39),
    onSecondary: Color(0XFF1F1F39),
    onSecondaryContainer: Color(0XFFFFFFFF),
    onTertiary: Color(0XFF1F1F39),
    onTertiaryContainer: Color(0XFFFFFFFF),

    // Other colors
    outline: Color(0XFFFFFFFF),
    outlineVariant: Color(0XFFFFFFFF),
    scrim: Color(0XFFFFFFFF),
    shadow: Color(0XFFFFFFFF),

    // Inverse colors
    inversePrimary: Color(0XFFFFFFFF),
    inverseSurface: Color(0XFFFFFFFF),

    // Pending colors
    onSurface: Color(0XFF1F1F39),
    onSurfaceVariant: Color(0XFFFFFFFF),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // BlueGray
  Color get blueGray200 => Color(0XFFB8B8D2);
  Color get blueGray400 => Color(0XFF858597);

  // Gray
  Color get gray500 => Color(0XFF9393A3);

  // Orange
  Color get orangeA700 => Color(0XFFFF6905);

  // Red
  Color get red50 => Color(0XFFFFE7EE);
  Color get red5001 => Color(0XFFFFEBF0);

  // Yellow
  Color get yellowA700 => Color(0XFFFFD301);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();