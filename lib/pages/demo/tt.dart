import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '商城主页',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商城主页'),
      ),
      body: Column(
        children: [
          // 搜索框
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '寻找宝贝店铺',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          // 导航按钮
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem('assets/images/icon1.png', '淘宝票'),
                _buildNavItem('assets/images/icon2.png', '飞猪旅行'),
                _buildNavItem('assets/images/icon3.png', '连连消'),
                _buildNavItem('assets/images/icon4.png', 'U先试用'),
                _buildNavItem('assets/images/icon5.png', '聚划算'),
              ],
            ),
          ),
          // 商品展示
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(8.0),
              children: [
                _buildProductCard('assets/images/product1.png',
                    '飞利浦 原装光盘 4.7G DVD-R 16X DVD刻录盘', '¥18.9'),
                _buildProductCard('assets/images/product2.png',
                    '奖状框证书框4K荣誉实木相框挂墙横幅A3营业执照框', '¥15'),
                _buildProductCard('assets/images/product3.png',
                    '干洗店通用包裹卷 透明包裹卷UCC洗衣店胶特种纸', '¥95'),
                _buildProductCard('assets/images/product4.png',
                    '圆形硅胶蛋糕保鲜POTS硅胶耐磨真实感胶性硅胶垫', '¥33'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Image.asset(
            iconPath,
            width: 50.0,
            height: 50.0,
          ),
          SizedBox(height: 5.0),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildProductCard(String imagePath, String title, String price) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 100.0,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 14.0)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price,
                style: TextStyle(fontSize: 16.0, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
