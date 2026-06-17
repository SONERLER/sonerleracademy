import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step12TargetWeight extends ConsumerStatefulWidget {
  const Step12TargetWeight({super.key});

  @override
  ConsumerState<Step12TargetWeight> createState() => _Step12TargetWeightState();
}

class _Step12TargetWeightState extends ConsumerState<Step12TargetWeight> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final existing = ref.read(onboardingProvider).data.targetWeight;
    if (existing != null) _controller.text = existing.toInt().toString();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(onboardingProvider.notifier);
    final data = ref.watch(onboardingProvider).data;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text('Hedef kilоn ne?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  data.currentWeight != null
                      ? 'Şu anki kilоn: ${data.currentWeight!.toInt()} kg'
                      : 'Ulaşmak istediğin kilоyu gir.',
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.xl),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  style: AppTextStyles.statNumber,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '70',
                    suffixText: 'kg',
                    suffixStyle: AppTextStyles.h3.copyWith(color: AppColors.textSecondary),
                  ),
                  onChanged: (val) {
                    final parsed = double.tryParse(val);
                    if (parsed != null && parsed > 30 && parsed < 300) {
                      notifier.setTargetWeight(parsed);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.targetWeight != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}