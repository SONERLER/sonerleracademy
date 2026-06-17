import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step09BodyType extends ConsumerWidget {
  const Step09BodyType({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(onboardingProvider).data;
    final notifier = ref.read(onboardingProvider.notifier);
    final isMale = data.gender != 'female';

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text('Hedef vücut tipин?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('AI koçun programını buna göre ayarlayacak.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                if (isMale) ...[
                  OnboardingOptionCard(
                    label: 'İnce & Fit',
                    subtitle: 'Düşük yağ, görünür kaslar',
                    icon: Icons.straighten_rounded,
                    isSelected: data.targetBodyType == 'lean',
                    onTap: () => notifier.setTargetBodyType('lean'),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  OnboardingOptionCard(
                    label: 'Atletik',
                    subtitle: 'Dengeli kas gelişimi ve güç',
                    icon: Icons.sports_gymnastics_rounded,
                    isSelected: data.targetBodyType == 'athletic',
                    onTap: () => notifier.setTargetBodyType('athletic'),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  OnboardingOptionCard(
                    label: 'Hacimli & Güçlü',
                    subtitle: 'Maksimum kas kütlesi',
                    icon: Icons.fitness_center_rounded,
                    isSelected: data.targetBodyType == 'bulk',
                    onTap: () => notifier.setTargetBodyType('bulk'),
                  ),
                ] else ...[
                  OnboardingOptionCard(
                    label: 'İnce & Zayıf',
                    subtitle: 'Hafif, ince ve fit görünüm',
                    icon: Icons.straighten_rounded,
                    isSelected: data.targetBodyType == 'slim',
                    onTap: () => notifier.setTargetBodyType('slim'),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  OnboardingOptionCard(
                    label: 'Atletik & Fit',
                    subtitle: 'Sıkı, tonlu ve güçlü',
                    icon: Icons.sports_gymnastics_rounded,
                    isSelected: data.targetBodyType == 'athletic',
                    onTap: () => notifier.setTargetBodyType('athletic'),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  OnboardingOptionCard(
                    label: 'Dolgun & Fit',
                    subtitle: 'Kadınsı hatlar, sağlıklı dolgunluk',
                    icon: Icons.favorite_rounded,
                    isSelected: data.targetBodyType == 'curvy',
                    onTap: () => notifier.setTargetBodyType('curvy'),
                  ),
                ],
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.targetBodyType != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}