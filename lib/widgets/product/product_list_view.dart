import 'package:flutter/material.dart';
import 'package:capsula_flutter/models/product_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/product_provider.dart';
import 'products.dart';

class ProductListView extends ConsumerWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();

    Future<void> loadMoreProducts() async {
      if (ref.read(productsProvider).isLoading) return;
      ref.read(productsProvider).setIsLoding(true);

      // 模拟网络请求延迟
      await Future.delayed(const Duration(seconds: 2));

      // 加载更多数据

      ref.read(productsProvider).addProducts([
        ProductModel(
          imagePath: 'assets/images/flutter_logo.png',
          title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
          price: '¥18.9',
        ),
      ]);
      ref.read(productsProvider).setIsLoding(false);
    }

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreProducts();
      }
    });

    return Consumer(
      builder: (context, ref, child) {
        final provider = ref.watch(productsProvider);
        return Expanded(
          child: GridView.builder(
            controller: scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: provider.products.length + (provider.isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == provider.products.length) {
                return const Center(child: CircularProgressIndicator());
              }
              return ProductCard(
                imagePath: provider.products[index].imagePath,
                title: provider.products[index].title,
                price: provider.products[index].price,
              );
            },
          ),
        );
      },
    );
  }
}
