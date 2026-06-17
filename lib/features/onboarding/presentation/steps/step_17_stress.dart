import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step17Stress extends ConsumerWidget {
  const Step17Stress({super.key});

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
                Text('Günlük stres seviyен?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Stres, toparlanma ve hormon dengesini etkiler.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Düşük',
                  subtitle: 'Genelde sakin ve huzurlu hissediyorum',
                  icon: Icons.sentiment_very_satisfied_rounded,
                  isSelected: data.stressLevel == 'low',
                  onTap: () => notifier.setStressLevel('low'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Orta',
                  subtitle: 'Zaman zaman stresli oluyorum',
                  icon: Icons.sentiment_neutral_rounded,
                  isSelected: data.stressLevel == 'medium',
                  onTap: () => notifier.setStressLevel('medium'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Yüksek',
                  subtitle: 'Çoğu zaman yoğun stres altındayım',
                  icon: Icons.sentiment_very_dissatisfied_rounded,
                  isSelected: data.stressLevel == 'high',
                  onTap: () => notifier.setStressLevel('high'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.stressLevel != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}