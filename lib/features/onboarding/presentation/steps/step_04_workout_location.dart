import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step04WorkoutLocation extends ConsumerWidget {
  const Step04WorkoutLocation({super.key});

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
                Text('Nerede antrenman yapıyorsun?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Programın buna göre hazırlanacak.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Spor Salonu',
                  subtitle: 'Ekipmanlı, tam donanımlı gym',
                  icon: Icons.fitness_center_rounded,
                  isSelected: data.workoutLocation == 'gym',
                  onTap: () => notifier.setWorkoutLocation('gym'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Evde',
                  subtitle: 'Ekipmansız veya minimal ekipmanla',
                  icon: Icons.home_rounded,
                  isSelected: data.workoutLocation == 'home',
                  onTap: () => notifier.setWorkoutLocation('home'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Her İkisi',
                  subtitle: 'Bazen salondan, bazen evden',
                  icon: Icons.swap_horiz_rounded,
                  isSelected: data.workoutLocation == 'both',
                  onTap: () => notifier.setWorkoutLocation('both'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.workoutLocation != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}