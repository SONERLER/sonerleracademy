/// Onboarding anketinden toplanan tüm kullanıcı verisi.
/// Riverpod state'i bu modeli tutar; Firebase'e kayıtta buradan okunur.
class OnboardingData {
  final String? gender;           // 'male' | 'female'
  final String? goal;             // 'lose_fat' | 'gain_muscle' | 'recomp' | 'maintain'
  final String? activityLevel;    // 'sedentary' | 'light' | 'moderate' | 'active' | 'very_active'
  final String? workoutLocation;  // 'gym' | 'home' | 'both'
  final String? workoutDays;      // '2-3' | '3-4' | '4-5' | '5+'
  final String? workoutDuration;  // '30' | '45' | '60' | '90+'
  final String? fitnessLevel;     // 'beginner' | 'intermediate' | 'advanced'
  final String? equipment;        // 'none' | 'basic' | 'full'
  final double? currentWeight;    // kg
  final double? targetWeight;     // kg
  final double? height;           // cm
  final int? age;
  final String? dietType;         // 'no_restriction' | 'vegetarian' | 'vegan' | 'gluten_free'
  final String? waterIntake;      // 'less_1' | '1_2' | '2_3' | 'more_3'
  final String? sleepHours;       // 'less_6' | '6_7' | '7_8' | 'more_8'
  final String? stressLevel;      // 'low' | 'medium' | 'high'
  final List<String> healthIssues; // ['back_pain', 'knee', ...]
  final String? motivation;       // 'health' | 'appearance' | 'performance' | 'confidence'
  final String? targetBodyType;   // (kadın) 'slim' | 'athletic' | 'curvy' — (erkek) 'lean' | 'athletic' | 'bulk'
  final String? supplementUsage;  // 'none' | 'basic' | 'experienced'

  const OnboardingData({
    this.gender,
    this.goal,
    this.activityLevel,
    this.workoutLocation,
    this.workoutDays,
    this.workoutDuration,
    this.fitnessLevel,
    this.equipment,
    this.currentWeight,
    this.targetWeight,
    this.height,
    this.age,
    this.dietType,
    this.waterIntake,
    this.sleepHours,
    this.stressLevel,
    this.healthIssues = const [],
    this.motivation,
    this.targetBodyType,
    this.supplementUsage,
  });

  OnboardingData copyWith({
    String? gender,
    String? goal,
    String? activityLevel,
    String? workoutLocation,
    String? workoutDays,
    String? workoutDuration,
    String? fitnessLevel,
    String? equipment,
    double? currentWeight,
    double? targetWeight,
    double? height,
    int? age,
    String? dietType,
    String? waterIntake,
    String? sleepHours,
    String? stressLevel,
    List<String>? healthIssues,
    String? motivation,
    String? targetBodyType,
    String? supplementUsage,
  }) {
    return OnboardingData(
      gender: gender ?? this.gender,
      goal: goal ?? this.goal,
      activityLevel: activityLevel ?? this.activityLevel,
      workoutLocation: workoutLocation ?? this.workoutLocation,
      workoutDays: workoutDays ?? this.workoutDays,
      workoutDuration: workoutDuration ?? this.workoutDuration,
      fitnessLevel: fitnessLevel ?? this.fitnessLevel,
      equipment: equipment ?? this.equipment,
      currentWeight: currentWeight ?? this.currentWeight,
      targetWeight: targetWeight ?? this.targetWeight,
      height: height ?? this.height,
      age: age ?? this.age,
      dietType: dietType ?? this.dietType,
      waterIntake: waterIntake ?? this.waterIntake,
      sleepHours: sleepHours ?? this.sleepHours,
      stressLevel: stressLevel ?? this.stressLevel,
      healthIssues: healthIssues ?? this.healthIssues,
      motivation: motivation ?? this.motivation,
      targetBodyType: targetBodyType ?? this.targetBodyType,
      supplementUsage: supplementUsage ?? this.supplementUsage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'goal': goal,
      'activityLevel': activityLevel,
      'workoutLocation': workoutLocation,
      'workoutDays': workoutDays,
      'workoutDuration': workoutDuration,
      'fitnessLevel': fitnessLevel,
      'equipment': equipment,
      'currentWeight': currentWeight,
      'targetWeight': targetWeight,
      'height': height,
      'age': age,
      'dietType': dietType,
      'waterIntake': waterIntake,
      'sleepHours': sleepHours,
      'stressLevel': stressLevel,
      'healthIssues': healthIssues,
      'motivation': motivation,
      'targetBodyType': targetBodyType,
      'supplementUsage': supplementUsage,
    };
  }
}