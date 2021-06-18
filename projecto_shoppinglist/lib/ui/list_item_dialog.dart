import 'package:flutter/material.dart';
import 'package:projecto_shoppinglist/util/dbhelper.dart';
import 'package:projecto_shoppinglist/models/list_items.dart';

class ListItemDialog{
  final txtName = TextEditingController();
  final txtQuantity = TextEditingController();
  final txtNote = TextEditingController();

  Widget buildDialog(BuildContext context, ListItem item, bool isNew){
    DbHelper helper = DbHelper();

    if (!isNew){
      txtName.text = item.name;
      txtQuantity.text = item.quantity;
      txtNote.text = item.note;
    }else{
      txtName.text = "";
      txtQuantity.text = "";
      txtNote.text = "";
    }

    return AlertDialog(
      title: Text((isNew)? 'New item' : 'Edit item'),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                  hintText: 'Item Name'
              ),
            ),
            TextField(
              controller: txtQuantity,
              decoration: InputDecoration(
                  hintText: 'Item Quantity'
              ),
            ),
            TextField(
              controller: txtNote,
              decoration: InputDecoration(
                  hintText: 'Item Note'
              ),
            ),

            ElevatedButton(
                child: Text('Save'),
                onPressed: (){
                  item.name = txtName.text;
                  item.quantity = txtQuantity.text;
                  item.note = txtNote.text;
                  helper.insertItem(item);
                  Navigator.pop(context);
                }
            )
          ],
        ),
      ),
    );
  }
}