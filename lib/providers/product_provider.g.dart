// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Products state management using Riverpod 3.0 Notifier pattern

@ProviderFor(Products)
const productsProvider = ProductsProvider._();

/// Products state management using Riverpod 3.0 Notifier pattern
final class ProductsProvider
    extends $NotifierProvider<Products, ProductsState> {
  /// Products state management using Riverpod 3.0 Notifier pattern
  const ProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsHash();

  @$internal
  @override
  Products create() => Products();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsState>(value),
    );
  }
}

String _$productsHash() => r'd9f5407d7cb9bab8b32260d20db6f97e0427e589';

/// Products state management using Riverpod 3.0 Notifier pattern

abstract class _$Products extends $Notifier<ProductsState> {
  ProductsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProductsState, ProductsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductsState, ProductsState>,
              ProductsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
