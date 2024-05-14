import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  final String title;
  const Product({
    super.key,
    required this.title,
  });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Text(
              "${widget.title} Page",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                Beamer.of(context).popRoute();
              },
              child: Text(
                "Go back",
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
