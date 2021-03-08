import 'package:demo_app/models/models.dart';

abstract class ShoppingEvent {}

class DeleteProductEvent extends ShoppingEvent {
  final Product product;
  DeleteProductEvent({this.product});
}

class MinusProductEvent extends ShoppingEvent {
  final Product product;
  MinusProductEvent({this.product});
}

class AddAmountProductEvent extends ShoppingEvent {
  final Product product;
  AddAmountProductEvent({this.product});
}

class AddProductEvent extends ShoppingEvent {
  final Product product;
  AddProductEvent({this.product});
}
