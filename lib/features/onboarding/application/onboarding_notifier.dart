import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/onboarding_data.dart';

/// Onboarding akışının toplam adım sayısı.
const int kOnboardingTotalSteps = 20;

/// Onboarding state'i — veri + mevcut adım.
class OnboardingState {
  final OnboardingData data;
  final int currentStep; // 0'dan başlar

  const OnboardingState({
    this.data = const OnboardingData(),
    this.currentStep = 0,
  });

  OnboardingState copyWith({
    OnboardingData? data,
    int? currentStep,
  }) {
    return OnboardingState(
      data: data ?? this.data,
      currentStep: currentStep ?? this.currentStep,
    );
  }

  double get progress => (currentStep + 1) / kOnboardingTotalSteps;
  bool get isLastStep => currentStep >= kOnboardingTotalSteps - 1;
}

/// Onboarding akışını yöneten Notifier.
class OnboardingNotifier extends Notifier<OnboardingState> {
  @override
  OnboardingState build() => const OnboardingState();

  // === Adım Navigasyonu ===

  void nextStep() {
    if (!state.isLastStep) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void goToStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  // === Veri Güncelleme ===

  void setGender(String gender) {
    state = state.copyWith(data: state.data.copyWith(gender: gender));
  }

  void setGoal(String goal) {
    state = state.copyWith(data: state.data.copyWith(goal: goal));
  }

  void setActivityLevel(String level) {
    state = state.copyWith(data: state.data.copyWith(activityLevel: level));
  }

  void setWorkoutLocation(String location) {
    state = state.copyWith(data: state.data.copyWith(workoutLocation: location));
  }

  void setWorkoutDays(String days) {
    state = state.copyWith(data: state.data.copyWith(workoutDays: days));
  }

  void setWorkoutDuration(String duration) {
    state = state.copyWith(data: state.data.copyWith(workoutDuration: duration));
  }

  void setFitnessLevel(String level) {
    state = state.copyWith(data: state.data.copyWith(fitnessLevel: level));
  }

  void setEquipment(String equipment) {
    state = state.copyWith(data: state.data.copyWith(equipment: equipment));
  }

  void setCurrentWeight(double weight) {
    state = state.copyWith(data: state.data.copyWith(currentWeight: weight));
  }

  void setTargetWeight(double weight) {
    state = state.copyWith(data: state.data.copyWith(targetWeight: weight));
  }

  void setHeight(double height) {
    state = state.copyWith(data: state.data.copyWith(height: height));
  }

  void setAge(int age) {
    state = state.copyWith(data: state.data.copyWith(age: age));
  }

  void setDietType(String diet) {
    state = state.copyWith(data: state.data.copyWith(dietType: diet));
  }

  void setWaterIntake(String water) {
    state = state.copyWith(data: state.data.copyWith(waterIntake: water));
  }

  void setSleepHours(String sleep) {
    state = state.copyWith(data: state.data.copyWith(sleepHours: sleep));
  }

  void setStressLevel(String stress) {
    state = state.copyWith(data: state.data.copyWith(stressLevel: stress));
  }

  void toggleHealthIssue(String issue) {
    final current = List<String>.from(state.data.healthIssues);
    if (current.contains(issue)) {
      current.remove(issue);
    } else {
      current.add(issue);
    }
    state = state.copyWith(data: state.data.copyWith(healthIssues: current));
  }

  void setMotivation(String motivation) {
    state = state.copyWith(data: state.data.copyWith(motivation: motivation));
  }

  void setTargetBodyType(String bodyType) {
    state = state.copyWith(data: state.data.copyWith(targetBodyType: bodyType));
  }

  void setSupplementUsage(String usage) {
    state = state.copyWith(data: state.data.copyWith(supplementUsage: usage));
  }

  void reset() {
    state = const OnboardingState();
  }
}

/// Global provider — tüm onboarding ekranları bunu okur/yazar.
final onboardingProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
  OnboardingNotifier.new,
);