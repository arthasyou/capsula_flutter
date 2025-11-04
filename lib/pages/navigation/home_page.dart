import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:capsula_flutter/widgets/product/product_list_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 搜索框
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: '寻找宝贝店铺',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),

        const ProductListView(),

        // Expanded(
        //   child: GridView.count(
        //     crossAxisCount: 2,
        //     padding: const EdgeInsets.all(8.0),
        //     children: const [
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘',
        //         price: '¥18.9',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '奖状框证书框4K荣誉实木相框挂墙横幅A3营业执照框',
        //         price: '¥15',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '干洗店通用包裹卷 透明包裹卷UCC洗衣店胶特种纸',
        //         price: '¥95',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '圆形硅胶蛋糕保鲜POTS硅胶耐磨真实感胶性硅胶垫',
        //         price: '¥33',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '圆形硅胶蛋糕保鲜POTS硅胶耐磨真实感胶性硅胶垫',
        //         price: '¥33',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '圆形硅胶蛋糕保鲜POTS硅胶耐磨真实感胶性硅胶垫',
        //         price: '¥33',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '圆形硅胶蛋糕保鲜POTS硅胶耐磨真实感胶性硅胶垫',
        //         price: '¥33',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '圆形硅胶蛋糕保鲜POTS硅胶耐磨真实感胶性硅胶垫',
        //         price: '¥33',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '圆形硅胶蛋糕保鲜POTS硅胶耐磨真实感胶性硅胶垫',
        //         price: '¥33',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '圆形硅胶蛋糕保鲜POTS硅胶耐磨真实感胶性硅胶垫',
        //         price: '¥33',
        //       ),
        //       ProductCard(
        //         imagePath: 'assets/images/fruit_btn_bet_12.png',
        //         title: '圆形硅胶蛋糕保鲜POTS硅胶耐磨真实感胶性硅胶垫',
        //         price: '¥33',
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
