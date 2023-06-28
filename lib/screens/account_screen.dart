import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkResponse(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.add),
                ),
              ),
              const Text(
                "Nazwa",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
            child: Card(
              child: ListTile(
                title: const Text("Wyloguj"),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
            child: Card(
              child: ListTile(
                title: const Text("Zamówienia"),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
            child: Card(
              child: ListTile(
                title: const Text("Dane resturacji"),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
