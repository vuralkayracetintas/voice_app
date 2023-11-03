part of 'voice_bloc.dart';

sealed class VoiceState extends Equatable {
  const VoiceState();
  
  @override
  List<Object> get props => [];
}

final class VoiceInitial extends VoiceState {}
