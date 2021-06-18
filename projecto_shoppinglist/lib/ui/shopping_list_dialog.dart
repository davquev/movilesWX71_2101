import 'package:flutter/material.dart';
import 'package:projecto_shoppinglist/util/dbhelper.dart';
import 'package:projecto_shoppinglist/models/shopping_list.dart';

class ShoppingListDialog{
  final txtName = TextEditingController();
  final txtPriority = TextEditingController();

  Widget buildDialog(BuildContext context, ShoppingList list, bool isNew){
    DbHelper helper = DbHelper();

    if (!isNew){
      txtName.text = list.name;
      txtPriority.text = list.priority.toString();
    }else{
      txtName.text = "";
      txtPriority.text = "";
    }

    return AlertDialog(
      title: Text((isNew)? 'New shopping List' : 'Edit shopping List'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                hintText: 'Shopping List Name'
              ),
            ),
            TextField(
              controller: txtPriority,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Shopping List Priority (1-3)'
              ),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: (){
                list.name = txtName.text;
                list.priority = int.parse(txtPriority.text);
                helper.insertList(list);
                Navigator.pop(context);
              }
            )
          ],
        ),
      ),
    );
  }
}