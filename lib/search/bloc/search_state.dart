import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  final List<String> result;

  const SearchInitial({this.result});

  @override
  List<Object> get props => [result];
}

class SearchInProgress extends SearchState {}

class SearchSuccess extends SearchState {
  final List<String> result;

  const SearchSuccess({this.result});

  @override
  List<Object> get props => [result];
}

class SearchFailure extends SearchState {}
