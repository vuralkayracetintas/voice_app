part of 'voice_bloc.dart';

abstract class VoiceState extends Equatable {
  const VoiceState();
}

class VoiceInitial extends VoiceState {
  @override
  List<Object?> get props => [];
}

class VoiceLoading extends VoiceState {
  @override
  List<Object?> get props => [];
}

class VoiceLoaded extends VoiceState {
  @override
  List<Object?> get props => [];
}

class VoiceError extends VoiceState {
  final String message;

  const VoiceError(this.message);
  @override
  List<Object?> get props => [message];
}
