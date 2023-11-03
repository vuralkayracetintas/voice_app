import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voice_app/product/repository/voice_repo.dart';

part 'voice_event.dart';
part 'voice_state.dart';

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  final VoiceRepository voiceRepo;
  VoiceBloc(this.voiceRepo) : super(VoiceInitial()) {
    on<VoiceEvent>((event, emit) async {
      emit(VoiceLoading());
      try {
        emit(VoiceLoaded());
      } catch (e) {
        if (e is Exception) {
          emit(VoiceError(e.toString()));
        }
      }
    });
  }
}
