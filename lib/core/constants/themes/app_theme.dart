import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x90/core/constants/colors/app_colors.dart';

class AppTheme {
  // Light Theme - Kunduzgi rejim
  static ThemeData lightTheme = ThemeData(
    // Asosiy ranglar
    primarySwatch: MaterialColor(0xFF000000, _blackSwatch),
    primaryColor: AppColors.primaryBlack,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    canvasColor: AppColors.cardBackground,

    // Status Bar va Navigation Bar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryWhite,
      foregroundColor: AppColors.primaryBlack,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryBlack),
      titleTextStyle: TextStyle(
        color: AppColors.primaryBlack,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),

    // Tugmalar
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryButton,
        foregroundColor: AppColors.buttonText,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.secondaryButton,
        foregroundColor: AppColors.secondaryButtonText,
        elevation: 0,
        side: const BorderSide(color: AppColors.borderColor, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryBlack,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),

    // Input fieldlar
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.inputBorder, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.inputBorder, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.focusedBorder, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.errorRed, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.errorRed, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      hintStyle: const TextStyle(
        color: AppColors.hintText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(
        color: AppColors.secondaryText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Kartalar - To'g'rilangan
    cardTheme: const CardThemeData(
      color: AppColors.cardBackground,
      elevation: 2,
      shadowColor: AppColors.cardShadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // Bottom Navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.tabBackground,
      selectedItemColor: AppColors.activeTab,
      unselectedItemColor: AppColors.inactiveTab,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Matn temalari - Yangi format
    textTheme: const TextTheme(
      // displayLarge (eski headline1)
      displayLarge: TextStyle(
        color: AppColors.primaryText,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
      ),
      // displayMedium (eski headline2)
      displayMedium: TextStyle(
        color: AppColors.primaryText,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
      ),
      // displaySmall (eski headline3)
      displaySmall: TextStyle(
        color: AppColors.primaryText,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
      ),
      // headlineLarge (eski headline4)
      headlineLarge: TextStyle(
        color: AppColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      // headlineMedium (eski headline5)
      headlineMedium: TextStyle(
        color: AppColors.primaryText,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      // headlineSmall (eski headline6)
      headlineSmall: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),

      // titleLarge
      titleLarge: TextStyle(
        color: AppColors.primaryText,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      // titleMedium
      titleMedium: TextStyle(
        color: AppColors.primaryText,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      // titleSmall
      titleSmall: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      // bodyLarge (eski bodyText1)
      bodyLarge: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),
      // bodyMedium (eski bodyText2)
      bodyMedium: TextStyle(
        color: AppColors.secondaryText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),
      // bodySmall
      bodySmall: TextStyle(
        color: AppColors.secondaryText,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),

      // labelLarge (eski button)
      labelLarge: TextStyle(
        color: AppColors.buttonText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      // labelMedium
      labelMedium: TextStyle(
        color: AppColors.primaryText,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
      // labelSmall (eski overline)
      labelSmall: TextStyle(
        color: AppColors.hintText,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerColor,
      thickness: 1,
      space: 1,
    ),

    // Icon tema
    iconTheme: const IconThemeData(color: AppColors.primaryBlack, size: 24),

    // Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryBlack,
      foregroundColor: AppColors.primaryWhite,
      elevation: 4,
    ),

    // Progress Indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryBlack,
      linearTrackColor: AppColors.progressBackground,
      circularTrackColor: AppColors.progressBackground,
    ),

    // Snack Bar
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.primaryBlack,
      contentTextStyle: const TextStyle(
        color: AppColors.primaryWhite,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    ),

    // Dialog
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.cardBackground,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: const TextStyle(
        color: AppColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: const TextStyle(
        color: AppColors.secondaryText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryWhite;
        }
        return AppColors.hintText;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryBlack;
        }
        return AppColors.dividerColor;
      }),
    ),

    // Slider
    sliderTheme: const SliderThemeData(
      activeTrackColor: AppColors.primaryBlack,
      inactiveTrackColor: AppColors.dividerColor,
      thumbColor: AppColors.primaryBlack,
      overlayColor: AppColors.shadowColor,
    ),

    // ColorScheme - Yangi Flutter uchun muhim
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBlack,
      onPrimary: AppColors.primaryWhite,
      secondary: AppColors.uberGreen,
      onSecondary: AppColors.primaryWhite,
      surface: AppColors.cardBackground,
      onSurface: AppColors.primaryText,
      background: AppColors.backgroundColor,
      onBackground: AppColors.primaryText,
      error: AppColors.errorRed,
      onError: AppColors.primaryWhite,
    ),
  );

  // Dark Theme - Tungi rejim
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: MaterialColor(0xFFFFFFFF, _whiteSwatch),
    primaryColor: AppColors.primaryWhite,
    scaffoldBackgroundColor: AppColors.darkBackground,
    canvasColor: const Color(0xFF2C2C2E),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.primaryWhite,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryWhite),
      titleTextStyle: TextStyle(
        color: AppColors.primaryWhite,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.primaryWhite,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: AppColors.primaryWhite,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        color: AppColors.primaryWhite,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: AppColors.primaryWhite,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: AppColors.primaryWhite,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: AppColors.primaryWhite,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.primaryWhite,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColors.hintText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColors.hintText,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: AppColors.primaryBlack,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryWhite,
      onPrimary: AppColors.primaryBlack,
      secondary: AppColors.uberGreen,
      onSecondary: AppColors.primaryBlack,
      surface: Color(0xFF2C2C2E),
      onSurface: AppColors.primaryWhite,
      background: AppColors.darkBackground,
      onBackground: AppColors.primaryWhite,
      error: AppColors.errorRed,
      onError: AppColors.primaryWhite,
    ),
  );

  // Material Color Swatch
  static const Map<int, Color> _blackSwatch = {
    50: Color(0xFFE0E0E0),
    100: Color(0xFFB3B3B3),
    200: Color(0xFF808080),
    300: Color(0xFF4D4D4D),
    400: Color(0xFF262626),
    500: Color(0xFF000000),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  };

  static const Map<int, Color> _whiteSwatch = {
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFE0E0E0),
    700: Color(0xFFB3B3B3),
    800: Color(0xFF808080),
    900: Color(0xFF4D4D4D),
  };
}
