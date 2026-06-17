import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step19Motivation extends ConsumerWidget {
  const Step19Motivation({super.key});

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
                Text('Seni en çok ne motive ediyor?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('AI koçun mesajlarını buna göre kişiselleştirecek.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Sağlık',
                  subtitle: 'Daha sağlıklı ve enerjik hissetmek',
                  icon: Icons.favorite_rounded,
                  isSelected: data.motivation == 'health',
                  onTap: () => notifier.setMotivation('health'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Görünüm',
                  subtitle: 'Aynaya bakınca kendimden memnun olmak',
                  icon: Icons.star_rounded,
                  isSelected: data.motivation == 'appearance',
                  onTap: () => notifier.setMotivation('appearance'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Performans',
                  subtitle: 'Daha güçlü ve atletik olmak',
                  icon: Icons.bolt_rounded,
                  isSelected: data.motivation == 'performance',
                  onTap: () => notifier.setMotivation('performance'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Özgüven',
                  subtitle: 'Kendime daha çok güvenmek',
                  icon: Icons.emoji_emotions_rounded,
                  isSelected: data.motivation == 'confidence',
                  onTap: () => notifier.setMotivation('confidence'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.motivation != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}