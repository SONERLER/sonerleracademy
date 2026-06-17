import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step16Sleep extends ConsumerWidget {
  const Step16Sleep({super.key});

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
                Text('Geceleri kaç saat uyuyorsun?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Uyku toparlanma ve performansı doğrudan etkiler.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: '6 saatten az',
                  subtitle: 'Yetersiz uyku',
                  icon: Icons.bedtime_outlined,
                  isSelected: data.sleepHours == 'less_6',
                  onTap: () => notifier.setSleepHours('less_6'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '6–7 saat',
                  subtitle: 'Ortalama uyku',
                  icon: Icons.bedtime_rounded,
                  isSelected: data.sleepHours == '6_7',
                  onTap: () => notifier.setSleepHours('6_7'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '7–8 saat',
                  subtitle: 'İdeal uyku süresi',
                  icon: Icons.nightlight_rounded,
                  isSelected: data.sleepHours == '7_8',
                  onTap: () => notifier.setSleepHours('7_8'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '8 saatten fazla',
                  subtitle: 'Uzun uyku',
                  icon: Icons.dark_mode_rounded,
                  isSelected: data.sleepHours == 'more_8',
                  onTap: () => notifier.setSleepHours('more_8'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.sleepHours != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}
