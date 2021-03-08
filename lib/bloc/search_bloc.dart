import 'package:rxdart/rxdart.dart';

import 'package:demo_app/events/events.dart';
import 'package:demo_app/repositories/repositories.dart';
import 'package:demo_app/states/states.dart';
import 'package:demo_app/models/models.dart';

class SearchBloc {
  final AppRepository _repository = AppRepository();
  List<Product> _products = [];
  int get productsLength => _products.length;

  final BehaviorSubject<SearchState> _searchProductSubject = BehaviorSubject();
  final BehaviorSubject<SearchEvent> _searchEventSubject = BehaviorSubject();

  BehaviorSubject<SearchState> get search => _searchProductSubject;
  BehaviorSubject<SearchEvent> get searchEvent => _searchEventSubject;

  SearchBloc() {
    search.sink.add(ProductUninitializedState());
    searchEvent
        .debounceTime(Duration(milliseconds: 300))
        .listen(_mapEventToState);
  }

  _mapEventToState(SearchEvent event) {
    if (event is SearchEvent) _mapItemRequestToState(event);
  }

  _mapItemRequestToState(SearchEvent event) async {
    final currentState = search.value;
    if (event is SearchProductEvent) {
      search.sink.add(ProductFetchingState());

      ProductResponse response =
          await _repository.getProductsByKeyword(event.value);

      _products = response.products;

      if (_products.isNotEmpty && event.value.length > 0)
        search.sink.add(
          ProductFetchedState(
            products: limitProduct(0, 6),
            hasReachedMax: _products.length > 6 ? false : true,
            keyword: event.value,
          ),
        );
      else {
        search.sink.add(ProductEmptyState());
      }
      return;
    }

    if (event is LoadMoreEvent && !_hasReachedMax(currentState)) {
      if (currentState is ProductFetchedState) {
        List<Product> products = limitProduct(currentState.products.length, 4);
        products.isEmpty
            ? search.sink.add(currentState.copyWith(hasReachedMax: true))
            : search.sink.add(
                ProductFetchedState(
                  products: currentState.products + products,
                  hasReachedMax: false,
                ),
              );
      }
    }

    if (event is ClearSearchEvent) {
      search.sink.add(ProductUninitializedState());
    }
  }

  drain() {
    _searchProductSubject?.value = null;
    _searchEventSubject?.value = null;
  }

  bool _hasReachedMax(SearchState state) =>
      state is ProductFetchedState && state.hasReachedMax;

  List<Product> limitProduct(int index, int limit) {
    List<Product> products = [];

    for (int i = 0; i < limit; i++) {
      if (index >= _products.length) break;

      products.add(_products[index]);
      index++;
    }

    return products;
  }

  dipose() {
    _searchProductSubject.close();
    _searchEventSubject.close();
  }
}
