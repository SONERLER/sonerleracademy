import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step11CurrentWeight extends ConsumerStatefulWidget {
  const Step11CurrentWeight({super.key});

  @override
  ConsumerState<Step11CurrentWeight> createState() => _Step11CurrentWeightState();
}

class _Step11CurrentWeightState extends ConsumerState<Step11CurrentWeight> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final existing = ref.read(onboardingProvider).data.currentWeight;
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
    final weight = ref.watch(onboardingProvider).data.currentWeight;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text('Şu anki kilоn kaç?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Mevcut durumunu anlamamıza yardımcı olur.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  style: AppTextStyles.statNumber,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '75',
                    suffixText: 'kg',
                    suffixStyle: AppTextStyles.h3.copyWith(color: AppColors.textSecondary),
                  ),
                  onChanged: (val) {
                    final parsed = double.tryParse(val);
                    if (parsed != null && parsed > 30 && parsed < 300) {
                      notifier.setCurrentWeight(parsed);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: weight != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}