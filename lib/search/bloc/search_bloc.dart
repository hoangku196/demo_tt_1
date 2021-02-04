import 'dart:convert';
import 'dart:async';

import 'package:demo_app/models/models.dart';
import 'package:demo_app/repositories/photo_repository.dart';
import 'package:http/http.dart' as http;

import 'package:demo_app/search/bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final PhotoRepository repository;
  List<Photo> photos;

  SearchBloc({this.repository}) : super(PhotoUninitializedState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchEvent) yield* _mapItemRequestedToState(event);
  }

  Stream<SearchState> _mapItemRequestedToState(SearchEvent event) async* {
    final currentState = state;

    if(event is SearchAlbumIdEvent){
      photos = [];
      yield PhotoFetchingState();
      photos = await repository.fetchPhotoByAlbumId(event.value, 0, 5);
      yield PhotoFetchedState(photos: photos, hasReachedMax: false);
      return;
    }

    if(event is LoadMoreEvent && !_hasReachedMax(currentState)){
      if (currentState is PhotoFetchedState) {
        photos = await repository.fetchPhotoByAlbumId(
            event.currentValue, currentState.photos.length, 4);
        yield photos.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : PhotoFetchedState(
            photos: currentState.photos + photos, hasReachedMax: false);
      }
    }

    if(event is ClearSearchEvent){
      yield PhotoUninitializedState();
    }

    // if (event is SearchAlbumIdEvent && !_hasReachedMax(currentState)) {
    //   try {
    //     if (currentState is PhotoUninitializedState) {
    //       yield PhotoFetchingState();
    //       photos = await repository.fetchPhotoByAlbumId(event.value, 0, 6);
    //       yield PhotoFetchedState(photos: photos, hasReachedMax: false);
    //       return;
    //     }
    //     if (currentState is PhotoFetchedState) {
    //       photos = await repository.fetchPhotoByAlbumId(
    //           event.value, currentState.photos.length, 6);
    //       yield photos.isEmpty
    //           ? currentState.copyWith(hasReachedMax: true)
    //           : PhotoFetchedState(
    //               photos: currentState.photos + photos, hasReachedMax: false);
    //     }
    //   } catch (_) {}
    // }
  }

  bool _hasReachedMax(SearchState state) =>
      state is PhotoFetchedState && state.hasReachedMax;
}
