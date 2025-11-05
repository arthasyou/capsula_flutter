import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product_model.dart';

part 'product_provider.g.dart';

/// Products state containing list and loading status
class ProductsState {
  final List<ProductModel> products;
  final bool isLoading;

  const ProductsState({
    required this.products,
    required this.isLoading,
  });

  /// Create initial state with sample products
  factory ProductsState.initial() {
    return ProductsState(
      products: [
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
      ],
      isLoading: false,
    );
  }

  /// Copy with method for immutable updates
  ProductsState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
  }) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Products state management using Riverpod 3.0 Notifier pattern
@riverpod
class Products extends _$Products {
  @override
  ProductsState build() {
    return ProductsState.initial();
  }

  /// Set loading state
  void setIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  /// Add products to the list
  void addProducts(List<ProductModel> newProducts) {
    state = state.copyWith(
      products: [...state.products, ...newProducts],
      isLoading: false,
    );
  }

  /// Load more products (simulating API call)
  Future<void> loadMore() async {
    if (state.isLoading) return;

    setIsLoading(true);

    // Simulate network request delay
    await Future.delayed(const Duration(seconds: 2));

    // Add more products
    addProducts([
      ProductModel(
        imagePath: 'assets/images/flutter_logo.png',
        title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
        price: '¥18.9',
      ),
    ]);
  }
}
