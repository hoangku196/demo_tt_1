import 'package:demo_app/models/models.dart';

abstract class ShoppingState {}

class EmptyItemState extends ShoppingState {}

class HaveItemsState extends ShoppingState {
  final Map<Product, int> items;

  int getTotalValue() {
    int sum = 0;

    items.forEach((key, value) {
      sum += key.price * value;
    });

    return sum;
  }

  HaveItemsState({this.items});
}

class LoadingItemsState extends ShoppingState {}
