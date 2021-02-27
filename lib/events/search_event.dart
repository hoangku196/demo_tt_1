import 'package:meta/meta.dart';

abstract class SearchEvent {}

class ClearSearchEvent extends SearchEvent {}

class SearchProductEvent extends SearchEvent {
  final String value;
  SearchProductEvent({@required this.value});
}

class LoadMoreEvent extends SearchEvent {
  final String currentValue;
  LoadMoreEvent({@required this.currentValue});
}
