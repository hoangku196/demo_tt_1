import 'package:demo_app/models/models.dart';

abstract class SearchState {}

class ProductUninitializedState extends SearchState {}

class ProductFetchingState extends SearchState {}

class ProductFetchedState extends SearchState {
  final List<Product> products;
  final bool hasReachedMax;
  final String keyword;

  ProductFetchedState({this.products, this.hasReachedMax, this.keyword});

  ProductFetchedState copyWith({
    List<Product> products,
    bool hasReachedMax,
    String keyword,
  }) {
    return ProductFetchedState(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      keyword: keyword ?? this.keyword,
    );
  }
}

class ProductErrorState extends SearchState {}

class ProductEmptyState extends SearchState {}
