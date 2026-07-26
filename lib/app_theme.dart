import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand
  static const mainBrandColor = Color(0xFF0D9488);
  static const mainBrandDarkColor = Color(0xFF0F766E);
  static const mainBrandLightColor = Color(0xFF14B8A6);
  static const mainBrandSoftColor = Color(0xFFCCFBF1);

  // Backgrounds and surfaces
  static const pageBackgroundColor = Color(0xFFF8FAFA);
  static const cardBackgroundColor = Color(0xFFFFFFFF);
  static const elevatedSurfaceColor = Color(0xFFFFFFFF);
  static const sidebarBackgroundColor = Color(0xFFF0FDFA);
  static const topBarBackgroundColor = mainBrandColor;
  static const bottomBarBackgroundColor = Color(0xFFFFFFFF);

  // Text
  static const mainTextColor = Color(0xFF134E4A);
  static const secondaryTextColor = Color(0xFF64748B);
  static const mutedTextColor = Color(0xFF94A3B8);
  static const inverseTextColor = Color(0xFFFFFFFF);
  static const linkTextColor = mainBrandColor;

  // Borders and dividers
  static const borderColor = Color(0xFFCCFBF1);
  static const strongBorderColor = Color(0xFF99F6E4);
  static const dividerColor = Color(0xFFE2E8F0);
  static const focusBorderColor = mainBrandColor;

  // Buttons and interactive states
  static const primaryButtonColor = mainBrandColor;
  static const primaryButtonHoverColor = Color(0xFF0F766E);
  static const primaryButtonPressedColor = Color(0xFF115E59);
  static const primaryButtonTextColor = Color(0xFFFFFFFF);
  static const secondaryButtonColor = Color(0xFFE6FFFB);
  static const secondaryButtonTextColor = mainBrandDarkColor;
  static const disabledBackgroundColor = Color(0xFFE2E8F0);
  static const disabledTextColor = Color(0xFF94A3B8);

  // Inputs
  static const inputBackgroundColor = Color(0xFFFFFFFF);
  static const inputBorderColor = borderColor;
  static const inputFocusedBorderColor = mainBrandColor;
  static const inputPlaceholderTextColor = mutedTextColor;

  // Navigation and selection
  static const selectedNavigationItemColor = mainBrandColor;
  static const unselectedNavigationItemColor = secondaryTextColor;
  static const selectedNavigationBackgroundColor = Color(0xFFCCFBF1);

  // Highlights and status feedback
  static const highlightColor = Color(0xFF14B8A6);
  static const successColor = Color(0xFF16A34A);
  static const successBackgroundColor = Color(0xFFF0FDF4);
  static const warningColor = Color(0xFFF59E0B);
  static const warningBackgroundColor = Color(0xFFFFFBEB);
  static const errorColor = Color(0xFFDC2626);
  static const errorBackgroundColor = Color(0xFFFEF2F2);
  static const infoColor = Color(0xFF0EA5E9);
  static const infoBackgroundColor = Color(0xFFF0F9FF);

  // Effects
  static const overlayColor = Color(0x1A0D9488);
  static const splashColor = Color(0x330D9488);
  static const appBarShadowColor = Color(0x33000000);
  static const transparentColor = Color(0x00000000);
}

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.mainBrandColor,
      brightness: Brightness.light,
      primary: AppColors.mainBrandColor,
      onPrimary: AppColors.inverseTextColor,
      primaryContainer: AppColors.mainBrandSoftColor,
      onPrimaryContainer: AppColors.mainTextColor,
      secondary: AppColors.highlightColor,
      onSecondary: AppColors.inverseTextColor,
      secondaryContainer: AppColors.secondaryButtonColor,
      onSecondaryContainer: AppColors.secondaryButtonTextColor,
      tertiary: AppColors.infoColor,
      onTertiary: AppColors.inverseTextColor,
      surface: AppColors.cardBackgroundColor,
      onSurface: AppColors.mainTextColor,
      surfaceContainerHighest: AppColors.pageBackgroundColor,
      error: AppColors.errorColor,
      onError: AppColors.inverseTextColor,
      errorContainer: AppColors.errorBackgroundColor,
      onErrorContainer: AppColors.errorColor,
      outline: AppColors.borderColor,
      outlineVariant: AppColors.dividerColor,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.pageBackgroundColor,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.topBarBackgroundColor,
        foregroundColor: AppColors.inverseTextColor,
        centerTitle: true,
        elevation: 5,
        shadowColor: AppColors.appBarShadowColor,
        toolbarHeight: 70,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerColor,
        thickness: 1,
        space: 1,
      ),
      iconTheme: const IconThemeData(color: AppColors.secondaryTextColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.selectedNavigationItemColor,
        unselectedItemColor: AppColors.unselectedNavigationItemColor,
        backgroundColor: AppColors.bottomBarBackgroundColor,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.cardBackgroundColor,
        surfaceTintColor: AppColors.transparentColor,
        elevation: 1,
        shadowColor: AppColors.appBarShadowColor,
        margin: EdgeInsets.all(8),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackgroundColor,
        hintStyle: const TextStyle(color: AppColors.inputPlaceholderTextColor),
        labelStyle: const TextStyle(color: AppColors.secondaryTextColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.inputBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.inputFocusedBorderColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.disabledBackgroundColor;
            }
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryButtonPressedColor;
            }
            if (states.contains(WidgetState.hovered)) {
              return AppColors.primaryButtonHoverColor;
            }
            return AppColors.primaryButtonColor;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.disabledTextColor;
            }
            return AppColors.primaryButtonTextColor;
          }),
          overlayColor: const WidgetStatePropertyAll(AppColors.overlayColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(
            AppColors.secondaryButtonTextColor,
          ),
          side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.borderColor),
          ),
          overlayColor: const WidgetStatePropertyAll(AppColors.overlayColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(
            AppColors.linkTextColor,
          ),
          overlayColor: const WidgetStatePropertyAll(AppColors.overlayColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryButtonColor,
        foregroundColor: AppColors.primaryButtonTextColor,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.mainTextColor,
        contentTextStyle: TextStyle(color: AppColors.inverseTextColor),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: AppColors.mainTextColor),
        headlineMedium: TextStyle(color: AppColors.mainTextColor),
        headlineSmall: TextStyle(color: AppColors.mainTextColor),
        titleLarge: TextStyle(color: AppColors.mainTextColor),
        titleMedium: TextStyle(color: AppColors.mainTextColor),
        titleSmall: TextStyle(color: AppColors.mainTextColor),
        bodyLarge: TextStyle(color: AppColors.mainTextColor),
        bodyMedium: TextStyle(color: AppColors.mainTextColor),
        bodySmall: TextStyle(color: AppColors.secondaryTextColor),
        labelLarge: TextStyle(color: AppColors.mainTextColor),
        labelMedium: TextStyle(color: AppColors.secondaryTextColor),
        labelSmall: TextStyle(color: AppColors.mutedTextColor),
      ),
    );
  }
}
