import 'package:rxdart/rxdart.dart';

import 'package:demo_app/events/events.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/states/states.dart';

class ShoppingCartBloc {
  Map<Product, int> _items = {};
  final BehaviorSubject<ShoppingState> _shoppingCartState = BehaviorSubject();
  final BehaviorSubject<ShoppingEvent> _shoppingCartEvent = BehaviorSubject();

  BehaviorSubject<ShoppingState> get shoppingState => _shoppingCartState;
  BehaviorSubject<ShoppingEvent> get shoppingEvent => _shoppingCartEvent;

  ShoppingCartBloc() {
    shoppingState.sink.add(EmptyItemState());
    shoppingEvent.listen(_mapEventToState);
  }

  _mapEventToState(ShoppingEvent event) {
    if (event is ShoppingEvent) _mapItemRequestToState(event);
  }

  _mapItemRequestToState(ShoppingEvent event) {
    if (event is AddProductEvent) {
      if (_items.length == 0) {
        _items[event.product] = 1;
        shoppingState.sink.add(HaveItemsState(items: _items));
      } else if (_items.length > 0) {
        if (_items.keys.any((item) => item.id == event.product.id)) {
          _updateExistItem(event.product.id);
          shoppingState.sink.add(HaveItemsState(items: _items));
        } else {
          _items[event.product] = 1;
          shoppingState.sink.add(HaveItemsState(items: _items));
        }
      }
    }

    if (event is AddAmountProductEvent) {}

    if (event is MinusProductEvent) {
      _minusExistItem(event.product.id);
      shoppingState.sink.add(HaveItemsState(items: _items));
    }

    if (event is DeleteProductEvent) {
      _deleteItem(event.product.id);
      if (_items.length >= 1)
        shoppingState.sink.add(HaveItemsState(items: _items));
      else
        shoppingState.sink.add(EmptyItemState());
    }
  }

  _deleteItem(String id) {
    for (int i = 0; i < _items.keys.length; i++) {
      if (_items.keys.elementAt(i).id == id) {
        _items.remove(_items.keys.elementAt(i));
        break;
      }
    }
  }

  _updateExistItem(String id) {
    for (int i = 0; i < _items.keys.length; i++) {
      if (_items.keys.elementAt(i).id == id) {
        _items.update(_items.keys.elementAt(i), (value) => value + 1);
        break;
      }
    }
  }

  _minusExistItem(String id) {
    for (int i = 0; i < _items.keys.length; i++) {
      if (_items.keys.elementAt(i).id == id) {
        _items.update(_items.keys.elementAt(i), (value) => value - 1);
        break;
      }
    }
  }

  dispose() {
    _shoppingCartEvent?.close();
    _shoppingCartState?.close();
  }
}

final shoppingCartBloc = ShoppingCartBloc();
