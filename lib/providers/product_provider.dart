import 'package:flutter/material.dart';
import 'package:hooks_riverpod/legacy.dart';

import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoding(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  final List<ProductModel> _products = [
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
  ];
  List<ProductModel> get products => _products;
  void addProducts(List<ProductModel> products) {
    for (int i = 0; i < products.length; i++) {
      _products.add(products[i]);
    }
    notifyListeners();
  }
}

final productsProvider = ChangeNotifierProvider<ProductProvider>((ref) {
  return ProductProvider();
});
