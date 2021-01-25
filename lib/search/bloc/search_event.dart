import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchUnitToggled extends SearchEvent {
  final String value;

  const SearchUnitToggled({this.value});

  @override
  List<Object> get props => [];
}

class SearchIconClicked extends SearchEvent {
  @override
  List<Object> get props => [];
}
