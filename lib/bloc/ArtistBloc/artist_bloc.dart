import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:voice_app/product/model/artist_model.dart';
import 'package:voice_app/product/repository/artist_repository.dart';

part 'artist_event.dart';
part 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  final ArtistRepository artistRepository;
  ArtistBloc(this.artistRepository) : super(ArtistInitial()) {
    on<ArtistEvent>((event, emit) async {
      emit(ArtistLoading());
      try {
        final artistModel =await artistRepository.getArtistData();
        emit(ArtistLoaded(artistModel));
      } catch (e) {
        if(e is Exception){
          emit(ArtistError(e.toString()));
        }else{
          emit(ArtistError(
            'Something went wrong! ${e}'
          ));
        }
      }
    });
  }
}
