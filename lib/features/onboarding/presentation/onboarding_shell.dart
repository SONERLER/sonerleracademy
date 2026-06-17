import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/onboarding_notifier.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import 'steps/step_01_gender.dart';
import 'steps/step_02_goal.dart';
import 'steps/step_03_activity.dart';
import 'steps/step_04_workout_location.dart';
import 'steps/step_05_workout_days.dart';
import 'steps/step_06_workout_duration.dart';
import 'steps/step_07_fitness_level.dart';
import 'steps/step_08_equipment.dart';
import 'steps/step_09_body_type.dart';
import 'steps/step_10_height.dart';
import 'steps/step_11_current_weight.dart';
import 'steps/step_12_target_weight.dart';
import 'steps/step_13_age.dart';
import 'steps/step_14_diet.dart';
import 'steps/step_15_water.dart';
import 'steps/step_16_sleep.dart';
import 'steps/step_17_stress.dart';
import 'steps/step_18_health_issues.dart';
import 'steps/step_19_motivation.dart';
import 'steps/step_20_supplement.dart';

class OnboardingShell extends ConsumerWidget {
  const OnboardingShell({super.key});

  static const List<Widget> _steps = [
    Step01Gender(),
    Step02Goal(),
    Step03Activity(),
    Step04WorkoutLocation(),
    Step05WorkoutDays(),
    Step06WorkoutDuration(),
    Step07FitnessLevel(),
    Step08Equipment(),
    Step09BodyType(),
    Step10Height(),
    Step11CurrentWeight(),
    Step12TargetWeight(),
    Step13Age(),
    Step14Diet(),
    Step15Water(),
    Step16Sleep(),
    Step17Stress(),
    Step18HealthIssues(),
    Step19Motivation(),
    Step20Supplement(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);
    final step = onboarding.currentStep;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _TopBar(
              step: step,
              progress: onboarding.progress,
              onBack: step == 0
                  ? null
                  : () => notifier.previousStep(),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) {
                  final slide = Tween<Offset>(
                    begin: const Offset(0.08, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOut,
                  ));
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(position: slide, child: child),
                  );
                },
                child: KeyedSubtree(
                  key: ValueKey(step),
                  child: _steps[step],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final int step;
  final double progress;
  final VoidCallback? onBack;

  const _TopBar({
    required this.step,
    required this.progress,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.md,
      ),
      child: Row(
        children: [
          // Geri butonu
          SizedBox(
            width: 40,
            height: 40,
            child: onBack != null
                ? IconButton(
                    onPressed: onBack,
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                    color: AppColors.textPrimary,
                    padding: EdgeInsets.zero,
                  )
                : const SizedBox.shrink(),
          ),
          // Progress bar
          Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: AppColors.surfaceMuted,
                    valueColor: const AlwaysStoppedAnimation(AppColors.accent),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${step + 1} / $kOnboardingTotalSteps',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: 40), // simetri için
        ],
      ),
    );
  }
}