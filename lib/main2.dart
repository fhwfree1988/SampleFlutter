import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String description;
  final double price;

  Product({required this.name, required this.description, required this.price});
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(name: "Product 1", description: "Description 1", price: 19.99),
    Product(name: "Product 2", description: "Description 2", price: 29.99),
    Product(name: "Product 3", description: "Description 3", price: 39.99),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shop Page'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            product.name,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(product.description),
          SizedBox(height: 8.0),
          Text('\$${product.price.toStringAsFixed(2)}'),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Handle product click or add to cart action
              // You can navigate to the product details page or add the product to the cart
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
