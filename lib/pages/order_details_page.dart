import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderDetailsPage extends StatelessWidget {
  final Order order;

  const OrderDetailsPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order.id}'),
            // You can add more details about the order here
            for (var product in order.products)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.name),
                    Text("₹${convertToRupees(product.price).toStringAsFixed(2)}"),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  double convertToRupees(double dollars) {
    const double exchangeRate = 83.0; // Example exchange rate
    return dollars * exchangeRate;
  }
}
