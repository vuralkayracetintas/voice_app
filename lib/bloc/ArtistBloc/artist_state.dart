part of 'artist_bloc.dart';

@immutable
abstract class ArtistState extends Equatable {
  const ArtistState();
}

class ArtistInitial extends ArtistState {
  @override
  List<Object?> get props => [];
}

class ArtistLoading extends ArtistState {
  @override
  List<Object?> get props => [];
}

class ArtistLoaded extends ArtistState {
  final ArtistModel artistModel;

  const ArtistLoaded(this.artistModel);

  @override
  List<Object?> get props => [artistModel];
}

class ArtistError extends ArtistState {
  final String message;

  const ArtistError(this.message);

  @override
  List<Object?> get props => [message];
}
