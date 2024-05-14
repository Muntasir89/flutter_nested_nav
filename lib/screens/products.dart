import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Products",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  Beamer.of(context).beamToNamed('/product/product1');
                });
              },
              child: const Text(
                "Product 1",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Beamer.of(context).beamToNamed('/product/product2');
              },
              child: const Text(
                "Product 2",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
