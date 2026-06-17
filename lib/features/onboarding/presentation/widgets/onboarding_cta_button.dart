import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnboardingCtaButton extends StatelessWidget {
  final VoidCallback? onPressed; // null → pasif
  final String label;

  const OnboardingCtaButton({
    super.key,
    required this.onPressed,
    this.label = 'Devam Et',
  });

  @override
  Widget build(BuildContext context) {
    final isActive = onPressed != null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenPadding,
        AppSpacing.md,
        AppSpacing.screenPadding,
        AppSpacing.lg,
      ),
      child: SizedBox(
        width: double.infinity,
        height: AppSpacing.buttonHeight,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isActive ? AppColors.accent : AppColors.surfaceMuted,
            foregroundColor:
                isActive ? AppColors.textOnAccent : AppColors.textMuted,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            ),
          ),
          child: Text(
            label,
            style: AppTextStyles.buttonLarge.copyWith(
              color: isActive ? AppColors.textOnAccent : AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
