// To parse this JSON data, do
//
//     final artistModel = artistModelFromMap(jsonString);

import 'dart:convert';

ArtistModel artistModelFromMap(String str) => ArtistModel.fromMap(json.decode(str));

String artistModelToMap(ArtistModel data) => json.encode(data.toMap());

class ArtistModel {
    List<Voice>? voices;

    ArtistModel({
        this.voices,
    });

    ArtistModel copyWith({
        List<Voice>? voices,
    }) => 
        ArtistModel(
            voices: voices ?? this.voices,
        );

    factory ArtistModel.fromMap(Map<String, dynamic> json) => ArtistModel(
        voices: json["voices"] == null ? [] : List<Voice>.from(json["voices"]!.map((x) => Voice.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "voices": voices == null ? [] : List<dynamic>.from(voices!.map((x) => x.toMap())),
    };
}

class Voice {
    String? voiceId;
    String? name;
    String? category;
    FineTuning? fineTuning;
    Labels? labels;
    String? previewUrl;
    List<dynamic>? highQualityBaseModelIds;

    Voice({
        this.voiceId,
        this.name,
        this.category,
        this.fineTuning,
        this.labels,
        this.previewUrl,
        this.highQualityBaseModelIds,
    });

    Voice copyWith({
        String? voiceId,
        String? name,
        String? category,
        FineTuning? fineTuning,
        Labels? labels,
        String? previewUrl,
        List<dynamic>? highQualityBaseModelIds,
    }) => 
        Voice(
            voiceId: voiceId ?? this.voiceId,
            name: name ?? this.name,
            category: category ?? this.category,
            fineTuning: fineTuning ?? this.fineTuning,
            labels: labels ?? this.labels,
            previewUrl: previewUrl ?? this.previewUrl,
            highQualityBaseModelIds: highQualityBaseModelIds ?? this.highQualityBaseModelIds,
        );

    factory Voice.fromMap(Map<String, dynamic> json) => Voice(
        voiceId: json["voice_id"],
        name: json["name"],
        category: json["category"],
        fineTuning: json["fine_tuning"] == null ? null : FineTuning.fromMap(json["fine_tuning"]),
        labels: json["labels"] == null ? null : Labels.fromMap(json["labels"]),
        previewUrl: json["preview_url"],
        highQualityBaseModelIds: json["high_quality_base_model_ids"] == null ? [] : List<dynamic>.from(json["high_quality_base_model_ids"]!.map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "voice_id": voiceId,
        "name": name,
        "category": category,
        "fine_tuning": fineTuning?.toMap(),
        "labels": labels?.toMap(),
        "preview_url": previewUrl,
        "high_quality_base_model_ids": highQualityBaseModelIds == null ? [] : List<dynamic>.from(highQualityBaseModelIds!.map((x) => x)),
    };
}

class FineTuning {
    dynamic language;
    List<dynamic>? verificationFailures;
    int? verificationAttemptsCount;
    dynamic sliceIds;
    dynamic manualVerification;
    bool? manualVerificationRequested;

    FineTuning({
        this.language,
        this.verificationFailures,
        this.verificationAttemptsCount,
        this.sliceIds,
        this.manualVerification,
        this.manualVerificationRequested,
    });

    FineTuning copyWith({
        dynamic language,
        List<dynamic>? verificationFailures,
        int? verificationAttemptsCount,
        dynamic sliceIds,
        dynamic manualVerification,
        bool? manualVerificationRequested,
    }) => 
        FineTuning(
            language: language ?? this.language,
            verificationFailures: verificationFailures ?? this.verificationFailures,
            verificationAttemptsCount: verificationAttemptsCount ?? this.verificationAttemptsCount,
            sliceIds: sliceIds ?? this.sliceIds,
            manualVerification: manualVerification ?? this.manualVerification,
            manualVerificationRequested: manualVerificationRequested ?? this.manualVerificationRequested,
        );

    factory FineTuning.fromMap(Map<String, dynamic> json) => FineTuning(
        language: json["language"],
        verificationFailures: json["verification_failures"] == null ? [] : List<dynamic>.from(json["verification_failures"]!.map((x) => x)),
        verificationAttemptsCount: json["verification_attempts_count"],
        sliceIds: json["slice_ids"],
        manualVerification: json["manual_verification"],
        manualVerificationRequested: json["manual_verification_requested"],
    );

    Map<String, dynamic> toMap() => {
        "language": language,
        "verification_failures": verificationFailures == null ? [] : List<dynamic>.from(verificationFailures!.map((x) => x)),
        "verification_attempts_count": verificationAttemptsCount,
        "slice_ids": sliceIds,
        "manual_verification": manualVerification,
        "manual_verification_requested": manualVerificationRequested,
    };
}

class Labels {
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

    Labels copyWith({
        String? accent,
        String? description,
        String? age,
        String? gender,
        String? useCase,
    }) => 
        Labels(
            accent: accent ?? this.accent,
            description: description ?? this.description,
            age: age ?? this.age,
            gender: gender ?? this.gender,
            useCase: useCase ?? this.useCase,
        );

    factory Labels.fromMap(Map<String, dynamic> json) => Labels(
        accent: json["accent"],
        description: json["description"],
        age: json["age"],
        gender: json["gender"],
        useCase: json["use case"],
    );

    Map<String, dynamic> toMap() => {
        "accent": accent,
        "description": description,
        "age": age,
        "gender": gender,
        "use case": useCase,
    };
}
