import 'package:demo_app/models/models.dart';

abstract class SearchState {}

class ProductUninitializedState extends SearchState {}

class ProductFetchingState extends SearchState {}

class ProductFetchedState extends SearchState {
  final List<ProductResponse> productResponse;
  final bool hasReachedMax;

  ProductFetchedState({this.productResponse, this.hasReachedMax});

  ProductFetchedState copyWith({
    List<ProductResponse> products,
    bool hasReachedMax,
  }) {
    return ProductFetchedState(
      productResponse: productResponse ?? this.productResponse,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class ProductErrorState extends SearchState {}

class ProductEmptyState extends SearchState {}
