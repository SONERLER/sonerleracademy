import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step08Equipment extends ConsumerWidget {
  const Step08Equipment({super.key});

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
                Text('Hangi ekipmanlara erişimin var?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Ev antrenmanı için geçerli — salonsa atlanır.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Ekipman Yok',
                  subtitle: 'Sadece vücut ağırlığı hareketleri',
                  icon: Icons.person_rounded,
                  isSelected: data.equipment == 'none',
                  onTap: () => notifier.setEquipment('none'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Temel Ekipman',
                  subtitle: 'Dumbbell, direnç bandı, atlama ipi',
                  icon: Icons.fitness_center_rounded,
                  isSelected: data.equipment == 'basic',
                  onTap: () => notifier.setEquipment('basic'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Tam Donanım',
                  subtitle: 'Barbell, rack, kablo makinesi vb.',
                  icon: Icons.apartment_rounded,
                  isSelected: data.equipment == 'full',
                  onTap: () => notifier.setEquipment('full'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.equipment != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}