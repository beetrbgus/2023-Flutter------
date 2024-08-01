import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GloceryList extends StatefulWidget {
  const GloceryList({super.key});

  @override
  State<GloceryList> createState() => _GloceryListState();
}

class _GloceryListState extends State<GloceryList> {
  void _addItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Gloceries"),
        actions: [
          IconButton(
            onPressed: () {
              _addItem();
            },
            icon: const Icon(Icons.add),
          )
        ],
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
