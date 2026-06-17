import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step07FitnessLevel extends ConsumerWidget {
  const Step07FitnessLevel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(onboardingProvider).data;
    final notifier = ref.read(onboardingProvider.notifier);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text('Fitness deneyim seviyен?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Dürüst ol — sana en uygun programı seçelim.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Başlangıç',
                  subtitle: 'Düzenli antrenman yapmıyorum / yeni başlıyorum',
                  icon: Icons.sentiment_satisfied_rounded,
                  isSelected: data.fitnessLevel == 'beginner',
                  onTap: () => notifier.setFitnessLevel('beginner'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Orta Seviye',
                  subtitle: '6 aydan fazla düzenli antrenman deneyimim var',
                  icon: Icons.sentiment_satisfied_alt_rounded,
                  isSelected: data.fitnessLevel == 'intermediate',
                  onTap: () => notifier.setFitnessLevel('intermediate'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'İleri Seviye',
                  subtitle: '2+ yıl düzenli, teknik antrenman deneyimim var',
                  icon: Icons.emoji_events_rounded,
                  isSelected: data.fitnessLevel == 'advanced',
                  onTap: () => notifier.setFitnessLevel('advanced'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.fitnessLevel != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}