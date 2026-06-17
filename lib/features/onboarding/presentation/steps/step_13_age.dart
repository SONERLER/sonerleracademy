import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step13Age extends ConsumerStatefulWidget {
  const Step13Age({super.key});

  @override
  ConsumerState<Step13Age> createState() => _Step13AgeState();
}

class _Step13AgeState extends ConsumerState<Step13Age> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final existing = ref.read(onboardingProvider).data.age;
    if (existing != null) _controller.text = existing.toString();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(onboardingProvider.notifier);
    final age = ref.watch(onboardingProvider).data.age;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text('Kaç yaşındasın?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Yaşına uygun program ve kalori hesabı yapılır.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  style: AppTextStyles.statNumber,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '28',
                    suffixText: 'yaş',
                    suffixStyle: AppTextStyles.h3.copyWith(color: AppColors.textSecondary),
                  ),
                  onChanged: (val) {
                    final parsed = int.tryParse(val);
                    if (parsed != null && parsed >= 14 && parsed <= 99) {
                      notifier.setAge(parsed);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: age != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}