import 'package:rxdart/rxdart.dart';

import 'package:demo_app/events/events.dart';
import 'package:demo_app/repositories/repositories.dart';
import 'package:demo_app/states/states.dart';
import 'package:demo_app/models/models.dart';

class SearchBloc {
  SearchState state = ProductUninitializedState();

  final AppRepository _repository = AppRepository();

  final BehaviorSubject<SearchState> _searchProductSubject = BehaviorSubject();
  final BehaviorSubject<SearchEvent> _searchEventSubject = BehaviorSubject();

  BehaviorSubject<SearchState> get search => _searchProductSubject;
  BehaviorSubject<SearchEvent> get searchEvent => _searchEventSubject;

  SearchBloc() {
    searchEvent.listen((event) async {
final currentState = state;

      if (event is SearchProductEvent) {
        ProductResponse response =
            await _repository.getProductsByKeyword(event.value);
            response.products.isEmpty ? state.copy
      }
    });
  }
}
