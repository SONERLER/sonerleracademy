import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';
import '../widgets/onboarding_option_card.dart';
import '../widgets/onboarding_cta_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step14Diet extends ConsumerWidget {
  const Step14Diet({super.key});

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
                Text('Beslenme tercihin?', style: AppTextStyles.onboardingQuestion),
                const SizedBox(height: AppSpacing.sm),
                Text('Diyet planın buna göre hazırlanacak.', style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppSpacing.xl),
                OnboardingOptionCard(
                  label: 'Kısıtlama Yok',
                  subtitle: 'Her türlü gıdayı tüketebilirim',
                  icon: Icons.restaurant_rounded,
                  isSelected: data.dietType == 'no_restriction',
                  onTap: () => notifier.setDietType('no_restriction'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Vejetaryen',
                  subtitle: 'Et yemiyorum, süt ve yumurta tamam',
                  icon: Icons.eco_rounded,
                  isSelected: data.dietType == 'vegetarian',
                  onTap: () => notifier.setDietType('vegetarian'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Vegan',
                  subtitle: 'Hayvansal ürün tüketmiyorum',
                  icon: Icons.spa_rounded,
                  isSelected: data.dietType == 'vegan',
                  onTap: () => notifier.setDietType('vegan'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOptionCard(
                  label: 'Glütensiz',
                  subtitle: 'Glüten içeren gıdalardan kaçınıyorum',
                  icon: Icons.no_meals_rounded,
                  isSelected: data.dietType == 'gluten_free',
                  onTap: () => notifier.setDietType('gluten_free'),
                ),
              ],
            ),
          ),
        ),
        OnboardingCtaButton(
          onPressed: data.dietType != null ? () => notifier.nextStep() : null,
        ),
      ],
    );
  }
}
