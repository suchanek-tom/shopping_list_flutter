import 'package:flutter/material.dart';
import '../models/item.dart';

class ShoppingListItem extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const ShoppingListItem({Key? key, required this.item, required this.onTap, required this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${item.name} (x${item.quantity})',
        style: TextStyle(
          decoration: item.isBought ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: item.isBought,
        onChanged: (value) => onTap(),
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
