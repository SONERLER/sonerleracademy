import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// SONERLER Academy tipografi sistemi.
/// Başlıklar için Manrope (kalın, modern), gövde metni için Inter kullanılır.
/// Tüm metin stilleri buradan beslenir.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _headingBase => GoogleFonts.manrope();
  static TextStyle get _bodyBase => GoogleFonts.inter();

  // === Başlıklar (Manrope, Bold/ExtraBold) ===
  static TextStyle get h1 => _headingBase.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get h2 => _headingBase.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.25,
      );

  static TextStyle get h3 => _headingBase.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get h4 => _headingBase.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  /// Onboarding soru başlıkları için (büyük, kalın)
  static TextStyle get onboardingQuestion => _headingBase.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.25,
      );

  // === Gövde Metni (Inter) ===
  static TextStyle get bodyLarge => _bodyBase.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => _bodyBase.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodySmall => _bodyBase.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  // === Yardımcı / İkincil Metin ===
  static TextStyle get caption => _bodyBase.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
        height: 1.3,
      );

  static TextStyle get overline => _bodyBase.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.textMuted,
        letterSpacing: 1.2,
        height: 1.2,
      );

  // === Buton Metinleri ===
  static TextStyle get buttonLarge => _headingBase.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: AppColors.textOnDark,
        height: 1.2,
      );

  static TextStyle get buttonMedium => _headingBase.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.textOnDark,
        height: 1.2,
      );

  // === Sayısal Vurgu (istatistik, kilo, kalori vb. büyük sayılar) ===
  static TextStyle get statNumber => _headingBase.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.1,
      );

  static TextStyle get statLabel => _bodyBase.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        height: 1.3,
      );
}