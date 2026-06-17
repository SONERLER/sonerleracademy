import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step10Height extends ConsumerStatefulWidget {
  const Step10Height({super.key});

  @override
  ConsumerState<Step10Height> createState() => _Step10HeightState();
}

class _Step10HeightState extends ConsumerState<Step10Height> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final existing = ref.read(onboardingProvider).data.height;
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
    final height = ref.watch(onboardingProvider).data.height;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text('Boyun kaç cm?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Kalori ve program hesaplamalarında kullanılır.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  style: AppTextStyles.statNumber,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '170',
                    suffixText: 'cm',
                    suffixStyle: AppTextStyles.h3.copyWith(color: AppColors.textSecondary),
                  ),
                  onChanged: (val) {
                    final parsed = double.tryParse(val);
                    if (parsed != null && parsed > 100 && parsed < 250) {
                      notifier.setHeight(parsed);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: height != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}