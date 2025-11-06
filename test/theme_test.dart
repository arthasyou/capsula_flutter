import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:capsula_flutter/theme/health_data_colors.dart';
import 'package:capsula_flutter/models/health_data_model.dart';

void main() {
  group('Theme Configuration Tests', () {
    test('Light theme brightness', () {
      final theme = ThemeData.light();
      expect(theme.brightness, Brightness.light);
    });

    test('Dark theme brightness', () {
      final theme = ThemeData.dark();
      expect(theme.brightness, Brightness.dark);
    });

    test('Health data colors should adapt to theme', () {
      final lightTheme = ThemeData.light();
      final darkTheme = ThemeData.dark();

      // Test blood pressure colors
      final lightBpColor =
          lightTheme.getHealthDataColor(HealthDataType.bloodPressure);
      final darkBpColor =
          darkTheme.getHealthDataColor(HealthDataType.bloodPressure);

      expect(lightBpColor, isNot(equals(darkBpColor)));
      expect(lightBpColor, const Color(0xFF2196F3)); // Light mode blue
      expect(darkBpColor, const Color(0xFF64B5F6)); // Dark mode light blue

      // Test blood sugar colors
      final lightBsColor =
          lightTheme.getHealthDataColor(HealthDataType.bloodSugar);
      final darkBsColor =
          darkTheme.getHealthDataColor(HealthDataType.bloodSugar);

      expect(lightBsColor, isNot(equals(darkBsColor)));
      expect(lightBsColor, const Color(0xFF4CAF50)); // Light mode green
      expect(darkBsColor, const Color(0xFF81C784)); // Dark mode light green
    });

    test('Background colors should have correct alpha', () {
      final theme = ThemeData.light();
      final bgColor =
          theme.getHealthDataBackgroundColor(HealthDataType.bloodPressure);

      // Background color should have 0.2 alpha
      expect(bgColor.alpha, closeTo(51, 1)); // 0.2 * 255 ≈ 51
    });

    test('All health data types should have colors defined', () {
      final theme = ThemeData.light();

      for (final type in HealthDataType.values) {
        final color = theme.getHealthDataColor(type);
        expect(color, isNotNull);
        expect(color, isNot(equals(Colors.transparent)));
      }
    });
  });
}
