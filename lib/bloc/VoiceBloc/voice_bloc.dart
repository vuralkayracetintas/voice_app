import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'voice_event.dart';
part 'voice_state.dart';

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  VoiceBloc() : super(VoiceInitial()) {
    on<VoiceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
