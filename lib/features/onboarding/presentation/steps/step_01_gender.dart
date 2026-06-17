import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step01Gender extends ConsumerWidget {
  const Step01Gender({super.key});

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
                Text('Cinsiyetin nedir?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Sana özel program oluşturmak için kullanacağız.',
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Erkek',
                  icon: Icons.male_rounded,
                  isSelected: data.gender == 'male',
                  onTap: () => notifier.setGender('male'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Kadın',
                  icon: Icons.female_rounded,
                  isSelected: data.gender == 'female',
                  onTap: () => notifier.setGender('female'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.gender != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}