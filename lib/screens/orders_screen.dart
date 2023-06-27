import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text("101530"),
                subtitle: const Text("Burger, addadasd, asdad"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("69 PLN"),
                    SizedBox(width: 9),
                    Icon(Icons.more_horiz_outlined)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
