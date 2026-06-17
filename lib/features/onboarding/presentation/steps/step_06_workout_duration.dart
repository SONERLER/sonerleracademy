import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step06WorkoutDuration extends ConsumerWidget {
  const Step06WorkoutDuration({super.key});

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
                Text('Antrenman başına ne kadar vaktın var?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Isınma ve soğuma dahil süreyi düşün.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: '30 Dakika',
                  subtitle: 'Yoğun ve kompakt antrenman',
                  icon: Icons.timer_rounded,
                  isSelected: data.workoutDuration == '30',
                  onTap: () => notifier.setWorkoutDuration('30'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '45 Dakika',
                  subtitle: 'Verimlilik ve yoğunluk dengesi',
                  icon: Icons.timer_rounded,
                  isSelected: data.workoutDuration == '45',
                  onTap: () => notifier.setWorkoutDuration('45'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '60 Dakika',
                  subtitle: 'Standart antrenman süresi',
                  icon: Icons.timer_rounded,
                  isSelected: data.workoutDuration == '60',
                  onTap: () => notifier.setWorkoutDuration('60'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '90+ Dakika',
                  subtitle: 'Uzun, detaylı antrenman seansları',
                  icon: Icons.timer_rounded,
                  isSelected: data.workoutDuration == '90+',
                  onTap: () => notifier.setWorkoutDuration('90+'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.workoutDuration != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}