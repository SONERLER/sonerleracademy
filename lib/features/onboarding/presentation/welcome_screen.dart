import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

/// Karşılama (Welcome) ekranı.
/// PRD madde 6.2 referans alınarak tasarlandı.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.lg),
              _buildLogo(),
              const SizedBox(height: AppSpacing.xl),
              Expanded(child: _buildHeroVisual()),
              const SizedBox(height: AppSpacing.lg),
              _buildTitleSection(),
              const SizedBox(height: AppSpacing.lg),
              _buildValueCards(),
              const SizedBox(height: AppSpacing.xl),
              _buildCtaButton(context),
              const SizedBox(height: AppSpacing.md),
              _buildLoginLink(context),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          ),
          child: const Icon(Icons.bolt, color: AppColors.textOnAccent, size: 22),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          'SONERLER Academy',
          style: AppTextStyles.h4.copyWith(color: AppColors.textOnDark),
        ),
      ],
    );
  }

  Widget _buildHeroVisual() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: const Center(
        child: Icon(Icons.fitness_center, color: AppColors.accent, size: 80),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        Text(
          'SONERLER Academy\'ye hoş geldin.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Akıllıca antrenman yap.',
          textAlign: TextAlign.center,
          style: AppTextStyles.h1.copyWith(color: AppColors.textOnDark),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Hedeflerine daha akıllı ulaş.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textMuted),
        ),
      ],
    );
  }

  Widget _buildValueCards() {
    return Row(
      children: [
        Expanded(
          child: _ValueCard(
            icon: Icons.auto_awesome,
            title: 'Kişiye özel\nprogramlar',
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _ValueCard(
            icon: Icons.show_chart,
            title: 'Akıllı ilerleme\ntakibi',
          ),
        ),
      ],
    );
  }

  Widget _buildCtaButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // İlerleyen adımda onboarding akışına yönlendirilecek
        },
        child: const Text('Başla'),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return TextButton(
      onPressed: () {
        // İlerleyen adımda login ekranına yönlendirilecek
      },
      child: Text(
        'Zaten hesabın var mı? Giriş yap',
        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ValueCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.accent, size: 24),
          const SizedBox(height: AppSpacing.sm),
          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textOnDark),
          ),
        ],
      ),
    );
  }
}