import 'package:flutter/material.dart';
import 'package:projecto_shoppinglist/util/dbhelper.dart';
import 'package:projecto_shoppinglist/models/shopping_list.dart';
import 'package:projecto_shoppinglist/models/list_items.dart';
import 'package:projecto_shoppinglist/ui/items_screen.dart';
import 'package:projecto_shoppinglist/ui/shopping_list_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DbHelper helper = DbHelper();
    //helper.testDB();

    return MaterialApp(
      title: "Lista de compras",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ShowList(),
    );
  }
}

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  DbHelper helper = DbHelper();
  List<ShoppingList> shoppingList;

  ShoppingListDialog dialog;
  @override
  void initState(){
    dialog = ShoppingListDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView.builder(
          itemCount: (shoppingList != null)? shoppingList.length : 0,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(shoppingList[index].name),
              leading: CircleAvatar(
                child: Text(shoppingList[index].priority.toString()),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ItemsScreen(shoppingList[index])
                  ),
                );
              },
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: (){
                  showDialog(
                      context: context,
                  builder: (BuildContext context) =>
                  dialog.buildDialog(context, shoppingList[index], false));
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
          builder: (BuildContext context) =>
          dialog.buildDialog(context, ShoppingList(0, '', 0), true),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future showData() async{
    await helper.openDb();

    shoppingList = await helper.getLists();

    setState(() {
      shoppingList = shoppingList;
    });
  }
}

