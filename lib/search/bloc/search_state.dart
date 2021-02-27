import 'package:demo_app/models/models.dart';

abstract class SearchState {}

class PhotoUninitializedState extends SearchState {}

class PhotoFetchingState extends SearchState {}

class PhotoFetchedState extends SearchState {
  final List<Photo> photos;
  final bool hasReachedMax;

  PhotoFetchedState({this.photos, this.hasReachedMax});

  PhotoFetchedState copyWith({
    List<Photo> photo,
    bool hasReachedMax,
  }) {
    return PhotoFetchedState(
      photos: photos ?? this.photos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class PhotoErrorState extends SearchState {}

class PhotoEmptyState extends SearchState {}
