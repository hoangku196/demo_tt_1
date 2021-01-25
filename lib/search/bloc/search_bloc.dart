import 'package:demo_app/search/bloc/blocs.dart';
import 'package:demo_app/search/repository/list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ListItem listItem;

  SearchBloc({this.listItem}) : super(SearchInitial(result: listItem.getAll));

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchUnitToggled) yield* _mapItemRequestedToState(event);
  }

  Stream<SearchState> _mapItemRequestedToState(SearchUnitToggled event) async* {
    yield SearchInProgress();
    await Future.delayed(Duration(seconds: 2));
    try {
      final List<String> result = listItem.getItems(event.value);
      yield SearchSuccess(result: result);
    } catch (_) {
      yield SearchFailure();
    }
  }
}
