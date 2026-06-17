import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step18HealthIssues extends ConsumerWidget {
  const Step18HealthIssues({super.key});

  static const _issues = [
    ('back_pain', 'Bel/Sırt Ağrısı', Icons.accessibility_new_rounded),
    ('knee', 'Diz Sorunu', Icons.directions_walk_rounded),
    ('shoulder', 'Omuz Sorunu', Icons.sports_handball_rounded),
    ('hypertension', 'Tansiyon', Icons.monitor_heart_rounded),
    ('diabetes', 'Diyabet', Icons.bloodtype_rounded),
    ('hernia', 'Fıtık', Icons.warning_rounded),
    ('none', 'Herhangi bir sorun yok', Icons.check_circle_rounded),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(onboardingProvider).data;
    final notifier = ref.read(onboardingProvider.notifier);
    final selected = data.healthIssues;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text('Sağlık sorunun var mı?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Birden fazla seçebilirsin. Program buna göre uyarlanır.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                ..._issues.map((issue) {
                  final (value, label, icon) = issue;
                  final isSelected = selected.contains(value);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: GestureDetector(
                      onTap: () {
                        if (value == 'none') {
                          // "Sorun yok" seçilince diğerlerini temizle
                          for (final i in _issues) {
                            if (selected.contains(i.$1) && i.$1 != 'none') {
                              notifier.toggleHealthIssue(i.$1);
                            }
                          }
                        } else {
                          // Başka bir şey seçilince "none" kaldır
                          if (selected.contains('none')) {
                            notifier.toggleHealthIssue('none');
                          }
                        }
                        notifier.toggleHealthIssue(value);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.md,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : AppColors.surface,
                          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                          border: Border.all(
                            color: isSelected ? AppColors.accent : AppColors.border,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(icon,
                                color: isSelected ? AppColors.accent : AppColors.textSecondary,
                                size: 22),
                            const SizedBox(width: AppSpacing.md),
                            Expanded(
                              child: Text(
                                label,
                                style: AppTextStyles.bodyLarge.copyWith(
                                  color: isSelected ? AppColors.textOnDark : AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Icon(Icons.check_rounded, color: AppColors.accent, size: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: selected.isNotEmpty ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}