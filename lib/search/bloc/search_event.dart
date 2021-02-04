import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SearchEvent {}

class ClearSearchEvent extends SearchEvent{}

class SearchAlbumIdEvent extends SearchEvent {
  final String value;

  SearchAlbumIdEvent({@required this.value});
}

class LoadMoreEvent extends SearchEvent {
  final String currentValue;

  LoadMoreEvent({@required this.currentValue});
}
