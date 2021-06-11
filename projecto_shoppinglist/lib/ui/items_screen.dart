import 'package:flutter/material.dart';
import 'package:projecto_shoppinglist/util/dbhelper.dart';
import 'package:projecto_shoppinglist/models/shopping_list.dart';
import 'package:projecto_shoppinglist/models/list_items.dart';

class ItemsScreen extends StatefulWidget {
  final ShoppingList shoppingList;
  ItemsScreen(this.shoppingList);

  @override
  _ItemsScreenState createState() => _ItemsScreenState(this.shoppingList);
}

class _ItemsScreenState extends State<ItemsScreen> {
  final ShoppingList shoppingList;
  _ItemsScreenState(this.shoppingList);

  DbHelper helper;
  List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoppingList.name),
      ),
      body: Container(),
    );
  }
}
