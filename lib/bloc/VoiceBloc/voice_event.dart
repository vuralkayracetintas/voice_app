part of 'voice_bloc.dart';

abstract class VoiceEvent extends Equatable {
  const VoiceEvent();
}

class LoadVoice extends VoiceEvent {
  @override
  List<Object?> get props => [];
}
