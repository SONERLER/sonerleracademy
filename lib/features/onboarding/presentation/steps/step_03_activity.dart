import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step03Activity extends ConsumerWidget {
  const Step03Activity({super.key});

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
                Text('Günlük aktivite seviyен?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('İş ve günlük hayatını düşün, sporu sayma.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Hareketsiz',
                  subtitle: 'Masa başı iş, çok az yürüyüş',
                  icon: Icons.chair_rounded,
                  isSelected: data.activityLevel == 'sedentary',
                  onTap: () => notifier.setActivityLevel('sedentary'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Az Hareketli',
                  subtitle: 'Hafif yürüyüş, ayaküstü işler',
                  icon: Icons.directions_walk_rounded,
                  isSelected: data.activityLevel == 'light',
                  onTap: () => notifier.setActivityLevel('light'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Orta Hareketli',
                  subtitle: 'Günde 30–60 dk aktif hareket',
                  icon: Icons.directions_run_rounded,
                  isSelected: data.activityLevel == 'moderate',
                  onTap: () => notifier.setActivityLevel('moderate'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Aktif',
                  subtitle: 'Fiziksel iş veya çok yürüyüş',
                  icon: Icons.electric_bolt_rounded,
                  isSelected: data.activityLevel == 'active',
                  onTap: () => notifier.setActivityLevel('active'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Çok Aktif',
                  subtitle: 'Ağır beden işi, sporcu yaşam tarzı',
                  icon: Icons.whatshot_rounded,
                  isSelected: data.activityLevel == 'very_active',
                  onTap: () => notifier.setActivityLevel('very_active'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.activityLevel != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}