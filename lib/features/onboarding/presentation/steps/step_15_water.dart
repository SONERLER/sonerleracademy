import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step15Water extends ConsumerWidget {
  const Step15Water({super.key});

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
                Text('Günlük ne kadar su içiyorsun?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Hidrasyon hedefini belirlemek için soruyoruz.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: '1 litreden az',
                  icon: Icons.water_drop_outlined,
                  isSelected: data.waterIntake == 'less_1',
                  onTap: () => notifier.setWaterIntake('less_1'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '1–2 litre',
                  icon: Icons.water_drop_rounded,
                  isSelected: data.waterIntake == '1_2',
                  onTap: () => notifier.setWaterIntake('1_2'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '2–3 litre',
                  icon: Icons.water_rounded,
                  isSelected: data.waterIntake == '2_3',
                  onTap: () => notifier.setWaterIntake('2_3'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '3 litreden fazla',
                  icon: Icons.waves_rounded,
                  isSelected: data.waterIntake == 'more_3',
                  onTap: () => notifier.setWaterIntake('more_3'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.waterIntake != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}