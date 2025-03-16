import 'package:flutter/material.dart';
import '../widgets/shopping_list_item.dart';
import '../models/item.dart';

class ShoppingListScreen extends StatefulWidget {
  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<Item> _items = [];

  void _addItem() {
    setState(() {
      _items.add(Item(name: 'Položka ${_items.length + 1}'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ShoppingListItem(item: _items[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
