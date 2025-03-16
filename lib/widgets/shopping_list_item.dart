import 'package:flutter/material.dart';
import '../models/item.dart';

class ShoppingListItem extends StatelessWidget {
  final Item item;

  const ShoppingListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
    );
  }
}
