part of 'artist_bloc.dart';

@immutable
abstract class ArtistEvent extends Equatable{
const ArtistEvent();
 }

 class LoadArtist extends ArtistEvent{
  @override
  
  List<Object?> get props => [];

 }
