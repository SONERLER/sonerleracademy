import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step20Supplement extends ConsumerWidget {
  const Step20Supplement({super.key});

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
                Text('Supplement kullanım deneyimin?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Supplement planın buna göre ayarlanacak.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Hiç Kullanmadım',
                  subtitle: 'Supplement konusunda yeniyim',
                  icon: Icons.block_rounded,
                  isSelected: data.supplementUsage == 'none',
                  onTap: () => notifier.setSupplementUsage('none'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Temel Kullanım',
                  subtitle: 'Protein tozu veya vitamin kullanıyorum',
                  icon: Icons.science_rounded,
                  isSelected: data.supplementUsage == 'basic',
                  onTap: () => notifier.setSupplementUsage('basic'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Deneyimliyim',
                  subtitle: 'Kreatin, pre-workout, aminoasit vb. kullanıyorum',
                  icon: Icons.biotech_rounded,
                  isSelected: data.supplementUsage == 'experienced',
                  onTap: () => notifier.setSupplementUsage('experienced'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.supplementUsage != null ? () => notifier.nextStep() : null,
          label: 'Programımı Oluştur',
        ),
      ],
    );
  }
}