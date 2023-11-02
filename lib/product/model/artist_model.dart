import 'package:equatable/equatable.dart';

class ArtistModel with EquatableMixin {
  List<Voices>? voices;

  ArtistModel({
    this.voices,
  });

  @override
  List<Object?> get props => [voices];

  ArtistModel copyWith({
    List<Voices>? voices,
  }) {
    return ArtistModel(
      voices: voices ?? this.voices,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'voices': voices,
    };
  }

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      voices: (json['voices'] as List<dynamic>?)
          ?.map((e) => Voices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Voices with EquatableMixin {
  String? voiceId;
  String? name;
  String? category;
  FineTuning? fineTuning;
  Labels? labels;
  String? previewUrl;

  Voices({
    this.voiceId,
    this.name,
    this.category,
    this.fineTuning,
    this.labels,
    this.previewUrl,
  });

  @override
  List<Object?> get props =>
      [voiceId, name, category, fineTuning, labels, previewUrl];

  Voices copyWith({
    String? voiceId,
    String? name,
    String? category,
    FineTuning? fineTuning,
    Labels? labels,
    String? previewUrl,
  }) {
    return Voices(
      voiceId: voiceId ?? this.voiceId,
      name: name ?? this.name,
      category: category ?? this.category,
      fineTuning: fineTuning ?? this.fineTuning,
      labels: labels ?? this.labels,
      previewUrl: previewUrl ?? this.previewUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'voice_id': voiceId,
      'name': name,
      'category': category,
      'fine_tuning': fineTuning,
      'labels': labels,
      'preview_url': previewUrl,
    };
  }

  factory Voices.fromJson(Map<String, dynamic> json) {
    return Voices(
      voiceId: json['voice_id'] as String?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      fineTuning: json['fine_tuning'] == null
          ? null
          : FineTuning.fromJson(json['fine_tuning'] as Map<String, dynamic>),
      labels: json['labels'] == null
          ? null
          : Labels.fromJson(json['labels'] as Map<String, dynamic>),
      previewUrl: json['preview_url'] as String?,
    );
  }
}

class FineTuning with EquatableMixin {
  String? language;

  FineTuning({
    this.language,
  });

  @override
  List<Object?> get props => [language];

  FineTuning copyWith({
    String? language,
  }) {
    return FineTuning(
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
    };
  }

  factory FineTuning.fromJson(Map<String, dynamic> json) {
    return FineTuning(
      language: json['language'] as String?,
    );
  }
}

class Labels with EquatableMixin {
  String? accent;
  String? description;
  String? age;
  String? gender;
  String? useCase;

  Labels({
    this.accent,
    this.description,
    this.age,
    this.gender,
    this.useCase,
  });

  @override
  List<Object?> get props => [accent, description, age, gender, useCase];

  Labels copyWith({
    String? accent,
    String? description,
    String? age,
    String? gender,
    String? useCase,
  }) {
    return Labels(
      accent: accent ?? this.accent,
      description: description ?? this.description,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      useCase: useCase ?? this.useCase,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accent': accent,
      'description': description,
      'age': age,
      'gender': gender,
      'use case': useCase,
    };
  }

  factory Labels.fromJson(Map<String, dynamic> json) {
    return Labels(
      accent: json['accent'] as String?,
      description: json['description'] as String?,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      useCase: json['use case'] as String?,
    );
  }
}
