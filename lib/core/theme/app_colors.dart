import 'package:flutter/material.dart';

/// SONERLER Academy renk paleti.
/// Kesin hex kodları kullanıcı tarafından sağlanana kadar bu değerler
/// geçerli tasarım yönü olarak kullanılır. Hepsi buradan merkezi yönetilir.
class AppColors {
  AppColors._();

  // === Ana Marka Renkleri ===
  /// Koyu lacivert/indigo - güven, profesyonellik, "academy" hissi
  static const Color primary = Color(0xFF131A36);
  static const Color primaryLight = Color(0xFF232C57);
  static const Color primaryDark = Color(0xFF0A0E22);

  // === Aksiyon (CTA) Rengi ===
  /// Doygun yeşil - enerji, ilerleme, başarı
  static const Color accent = Color(0xFF2BD672);
  static const Color accentLight = Color(0xFF5EE69A);
  static const Color accentDark = Color(0xFF1FA85A);

  // === İkincil Aksiyon ===
  /// Turuncu - dikkat çekici alternatif CTA / uyarı
  static const Color secondary = Color(0xFFFF7A3D);

  // === Nötr / Arkaplan ===
  static const Color background = Color(0xFFF7F8FB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFEFF1F6);

  // === Metin ===
  static const Color textPrimary = Color(0xFF131A36);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textOnAccent = Color(0xFF0A1A12);

  // === Durum Renkleri ===
  static const Color success = Color(0xFF2BD672);
  static const Color warning = Color(0xFFFFB020);
  static const Color error = Color(0xFFE5484D);
  static const Color info = Color(0xFF3D8BFF);

  // === Sınır / Ayraç ===
  static const Color border = Color(0xFFE3E6ED);
  static const Color divider = Color(0xFFEDEFF4);

  // === VIP / Premium Vurgu ===
  /// Altın/sarı ton - VIP rozet, kilitli içerik vurgusu
  static const Color vipGold = Color(0xFFE3B341);
  static const Color vipGoldLight = Color(0xFFF5DDA3);

  // === Gradient Tanımları ===
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient vipGradient = LinearGradient(
    colors: [vipGold, Color(0xFFC9962E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // === Kilitli İçerik Overlay ===
  static const Color lockedOverlay = Color(0x99131A36);

  // === Cinsiyet Bazlı Vurgu (onboarding dallanması için) ===
  static const Color maleAccent = Color(0xFF3D8BFF);
  static const Color femaleAccent = Color(0xFFE85D9C);
}