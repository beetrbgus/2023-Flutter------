import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GloceryList extends StatelessWidget {
  const GloceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Gloceries"),
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) {
            GroceryItem item = groceryItems[index];
            return ListTile(
              title: Text(item.name),
              leading: Container(
                width: 24,
                height: 24,
                color: item.category.color,
              ),
              trailing: Text(item.quantity.toString()),
            );
          }),
    );
  }
}
