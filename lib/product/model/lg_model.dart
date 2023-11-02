import 'package:equatable/equatable.dart';

class Response with EquatableMixin {
  String? modelId;
  String? name;
  bool? canBeFinetuned;
  bool? canDoTextToSpeech;
  bool? canDoVoiceConversion;
  bool? canUseStyle;
  bool? canUseSpeakerBoost;
  bool? servesProVoices;
  int? tokenCostFactor;
  String? description;
  bool? requiresAlphaAccess;
  int? maxCharactersRequestFreeUser;
  int? maxCharactersRequestSubscribedUser;
  List<Languages>? languages;

  Response({
    this.modelId,
    this.name,
    this.canBeFinetuned,
    this.canDoTextToSpeech,
    this.canDoVoiceConversion,
    this.canUseStyle,
    this.canUseSpeakerBoost,
    this.servesProVoices,
    this.tokenCostFactor,
    this.description,
    this.requiresAlphaAccess,
    this.maxCharactersRequestFreeUser,
    this.maxCharactersRequestSubscribedUser,
    this.languages,
  });

  @override
  List<Object?> get props => [
        modelId,
        name,
        canBeFinetuned,
        canDoTextToSpeech,
        canDoVoiceConversion,
        canUseStyle,
        canUseSpeakerBoost,
        servesProVoices,
        tokenCostFactor,
        description,
        requiresAlphaAccess,
        maxCharactersRequestFreeUser,
        maxCharactersRequestSubscribedUser,
        languages
      ];

  Response copyWith({
    String? modelId,
    String? name,
    bool? canBeFinetuned,
    bool? canDoTextToSpeech,
    bool? canDoVoiceConversion,
    bool? canUseStyle,
    bool? canUseSpeakerBoost,
    bool? servesProVoices,
    int? tokenCostFactor,
    String? description,
    bool? requiresAlphaAccess,
    int? maxCharactersRequestFreeUser,
    int? maxCharactersRequestSubscribedUser,
    List<Languages>? languages,
  }) {
    return Response(
      modelId: modelId ?? this.modelId,
      name: name ?? this.name,
      canBeFinetuned: canBeFinetuned ?? this.canBeFinetuned,
      canDoTextToSpeech: canDoTextToSpeech ?? this.canDoTextToSpeech,
      canDoVoiceConversion: canDoVoiceConversion ?? this.canDoVoiceConversion,
      canUseStyle: canUseStyle ?? this.canUseStyle,
      canUseSpeakerBoost: canUseSpeakerBoost ?? this.canUseSpeakerBoost,
      servesProVoices: servesProVoices ?? this.servesProVoices,
      tokenCostFactor: tokenCostFactor ?? this.tokenCostFactor,
      description: description ?? this.description,
      requiresAlphaAccess: requiresAlphaAccess ?? this.requiresAlphaAccess,
      maxCharactersRequestFreeUser:
          maxCharactersRequestFreeUser ?? this.maxCharactersRequestFreeUser,
      maxCharactersRequestSubscribedUser: maxCharactersRequestSubscribedUser ??
          this.maxCharactersRequestSubscribedUser,
      languages: languages ?? this.languages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'model_id': modelId,
      'name': name,
      'can_be_finetuned': canBeFinetuned,
      'can_do_text_to_speech': canDoTextToSpeech,
      'can_do_voice_conversion': canDoVoiceConversion,
      'can_use_style': canUseStyle,
      'can_use_speaker_boost': canUseSpeakerBoost,
      'serves_pro_voices': servesProVoices,
      'token_cost_factor': tokenCostFactor,
      'description': description,
      'requires_alpha_access': requiresAlphaAccess,
      'max_characters_request_free_user': maxCharactersRequestFreeUser,
      'max_characters_request_subscribed_user':
          maxCharactersRequestSubscribedUser,
      'languages': languages,
    };
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      modelId: json['model_id'] as String?,
      name: json['name'] as String?,
      canBeFinetuned: json['can_be_finetuned'] as bool?,
      canDoTextToSpeech: json['can_do_text_to_speech'] as bool?,
      canDoVoiceConversion: json['can_do_voice_conversion'] as bool?,
      canUseStyle: json['can_use_style'] as bool?,
      canUseSpeakerBoost: json['can_use_speaker_boost'] as bool?,
      servesProVoices: json['serves_pro_voices'] as bool?,
      tokenCostFactor: json['token_cost_factor'] as int?,
      description: json['description'] as String?,
      requiresAlphaAccess: json['requires_alpha_access'] as bool?,
      maxCharactersRequestFreeUser:
          json['max_characters_request_free_user'] as int?,
      maxCharactersRequestSubscribedUser:
          json['max_characters_request_subscribed_user'] as int?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Languages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Languages with EquatableMixin {
  String? languageId;
  String? name;

  Languages({
    this.languageId,
    this.name,
  });

  @override
  List<Object?> get props => [languageId, name];

  Languages copyWith({
    String? languageId,
    String? name,
  }) {
    return Languages(
      languageId: languageId ?? this.languageId,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language_id': languageId,
      'name': name,
    };
  }

  factory Languages.fromJson(Map<String, dynamic> json) {
    return Languages(
      languageId: json['language_id'] as String?,
      name: json['name'] as String?,
    );
  }
}
