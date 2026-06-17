import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step02Goal extends ConsumerWidget {
  const Step02Goal({super.key});

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
                Text('Ana hedefin ne?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Programın bu hedefe göre şekillenecek.',
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Yağ Yak',
                  subtitle: 'Vücut yağını azalt, form kazan',
                  icon: Icons.local_fire_department_rounded,
                  isSelected: data.goal == 'lose_fat',
                  onTap: () => notifier.setGoal('lose_fat'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Kas Kazan',
                  subtitle: 'Kas kütlesi ve güç artır',
                  icon: Icons.fitness_center_rounded,
                  isSelected: data.goal == 'gain_muscle',
                  onTap: () => notifier.setGoal('gain_muscle'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Rekomposizyon',
                  subtitle: 'Aynı anda yağ yak ve kas kazan',
                  icon: Icons.swap_horiz_rounded,
                  isSelected: data.goal == 'recomp',
                  onTap: () => notifier.setGoal('recomp'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Formu Koru',
                  subtitle: 'Mevcut kondisyonunu sürdür',
                  icon: Icons.shield_rounded,
                  isSelected: data.goal == 'maintain',
                  onTap: () => notifier.setGoal('maintain'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.goal != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}