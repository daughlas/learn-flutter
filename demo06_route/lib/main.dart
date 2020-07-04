import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;

  Product(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    title: '路由导航数据传递',
    home: ProductList(
      products: List.generate(20, (index) => Product('商品$index', '这是一个商品详情，编号$index'))
    )
  ));
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表')
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product: products[index])
                )
              );
            }
          );
        }
      )
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('${product.title}')
      ),
      body: Center(child: Text('${product.description}'),)
    );
  }
}