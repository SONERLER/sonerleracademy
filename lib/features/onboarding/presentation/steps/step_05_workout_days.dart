import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step05WorkoutDays extends ConsumerWidget {
  const Step05WorkoutDays({super.key});

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
                Text('Haftada kaç gün antrenman yapabilirsin?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Gerçekçi ol, programa uyum en önemli faktör.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: '2–3 Gün',
                  subtitle: 'Başlangıç dostu, sürdürülebilir',
                  icon: Icons.calendar_today_rounded,
                  isSelected: data.workoutDays == '2-3',
                  onTap: () => notifier.setWorkoutDays('2-3'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '3–4 Gün',
                  subtitle: 'Dengeli ilerleme için ideal',
                  icon: Icons.calendar_month_rounded,
                  isSelected: data.workoutDays == '3-4',
                  onTap: () => notifier.setWorkoutDays('3-4'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '4–5 Gün',
                  subtitle: 'Hızlı sonuç, yüksek bağlılık',
                  icon: Icons.event_repeat_rounded,
                  isSelected: data.workoutDays == '4-5',
                  onTap: () => notifier.setWorkoutDays('4-5'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: '5+ Gün',
                  subtitle: 'İleri seviye, yoğun program',
                  icon: Icons.local_fire_department_rounded,
                  isSelected: data.workoutDays == '5+',
                  onTap: () => notifier.setWorkoutDays('5+'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.workoutDays != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}