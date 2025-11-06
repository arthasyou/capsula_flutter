import 'package:flutter/material.dart';
import '../models/health_data_model.dart';

/// Health Data 类型颜色扩展
/// 支持 Light 和 Dark 主题
extension HealthDataColors on ThemeData {
  /// 获取健康数据类型的颜色
  Color getHealthDataColor(HealthDataType type) {
    final isDark = brightness == Brightness.dark;

    switch (type) {
      case HealthDataType.bloodPressure:
        return isDark
            ? const Color(0xFF64B5F6)  // 浅蓝色 (dark模式)
            : const Color(0xFF2196F3);  // 蓝色 (light模式)

      case HealthDataType.bloodSugar:
        return isDark
            ? const Color(0xFF81C784)  // 浅绿色 (dark模式)
            : const Color(0xFF4CAF50);  // 绿色 (light模式)

      case HealthDataType.heartRate:
        return isDark
            ? const Color(0xFFFFB74D)  // 浅橙色 (dark模式)
            : const Color(0xFFFF9800);  // 橙色 (light模式)

      case HealthDataType.checkup:
        return isDark
            ? const Color(0xFFBA68C8)  // 浅紫色 (dark模式)
            : const Color(0xFF9C27B0);  // 紫色 (light模式)

      case HealthDataType.medication:
        return isDark
            ? const Color(0xFFE57373)  // 浅红色 (dark模式)
            : const Color(0xFFF44336);  // 红色 (light模式)

      case HealthDataType.other:
        return isDark
            ? const Color(0xFFBDBDBD)  // 浅灰色 (dark模式)
            : const Color(0xFF9E9E9E);  // 灰色 (light模式)
    }
  }

  /// 获取健康数据类型的背景颜色（用于标签等）
  Color getHealthDataBackgroundColor(HealthDataType type) {
    return getHealthDataColor(type).withValues(alpha: 0.2);
  }

  /// 获取健康数据类型的容器颜色（用于卡片等）
  Color getHealthDataContainerColor(HealthDataType type) {
    return getHealthDataColor(type).withValues(alpha: 0.1);
  }
}
