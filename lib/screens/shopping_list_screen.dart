import 'package:flutter/material.dart';
import '../widgets/shopping_list_item.dart';
import '../models/item.dart';

class ShoppingListScreen extends StatefulWidget {
  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<Item> _items = [];

  // void _addItem() {
  //   setState(() {
  //     _items.add(Item(name: 'Item ${_items.length + 1}', isBought: false));
  //   });
  // }
  void _addItem() {
    TextEditingController nameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name of item'),
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty && quantityController.text.isNotEmpty) {
                setState(() {
                  _items.add(Item(
                    name: nameController.text,
                    quantity: int.tryParse(quantityController.text) ?? 1,
                    isBought: false,
                  ));
                });
                Navigator.of(context).pop();
              }
            },
            child: Text('Přidat'),
          ),
        ],
      ),
    );
  }

 void _toggleItem(int index) {
    setState(() {
      _items[index].isBought = !_items[index].isBought;
    });
  }

  void _removeItem(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Remove Item?'),
        content: Text('Are you sure to remove this item: "${_items[index].name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _items.removeAt(index);
              });
              Navigator.of(context).pop();
            },
            child: Text('Remove'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ShoppingListItem(
            item: _items[index],
            onTap: () => _toggleItem(index),
            onLongPress: () => _removeItem(index),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
