import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:projecto_shoppinglist/models/shopping_list.dart';
import 'package:projecto_shoppinglist/models/list_items.dart';

class DbHelper {
  final int version = 1;
  Database db;

  //codigo para que solo se abra una instancia de la BD
  static final DbHelper dbHelper = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper(){
    return dbHelper;
  }

  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'shopping3.db'),
          onCreate: (database, version) {
        database.execute('CREATE TABLE lists('
            'id INTEGER PRIMARY KEY,'
            'name TEXT,'
            'priority INTEGER)');
        database.execute('CREATE TABLE items('
                'id INTEGER PRIMARY KEY,'
                'idList INTEGER,'
                'name TEXT,'
                'quantity TEXT,'
                'note TEXT,' +
            'FOREIGN KEY(idList) REFERENCES lists(id))');
      }, version: version);
    }
    return db;
  }

  //probando la BD
  Future testDB() async {
    db = await openDb();

    await db.execute('INSERT INTO lists VALUES (0, "Otros2", 1)');
    await db.execute('INSERT INTO items VALUES (0, 0, "Celular", "1", "5g")');

    List lists = await db.rawQuery('select * from lists');
    List items = await db.rawQuery('select * from items');

    //print('se ag');
    print(lists[2]);
    print(items[2]);
  }

  //insert "lists"
  Future<int> insertList(ShoppingList list) async {
    int id = await this.db.insert(
          'lists',
          list.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

    return id;
  }

  //insert "items"
  Future<int> insertItem(ListItem item) async {
    int id = await this.db.insert(
          'items',
          item.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

    return id;
  }

  //listar tabla lists
  Future<List<ShoppingList>> getLists() async {
    final List<Map<String, dynamic>> maps = await db.query('lists');

    return List.generate(maps.length, (i) {
      return ShoppingList(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['priority'],
      );
    });
  }

  //listar tabla items por id de lists
  Future<List<ListItem>> getItems(int idList) async {
    final List<Map<String, dynamic>> maps = await db.query('items', where: 'idList = ?',
    whereArgs: [idList]);

    return List.generate(maps.length, (i) {
      return ListItem(
        maps[i]['id'],
        maps[i]['idList'],
        maps[i]['name'],
        maps[i]['quantity'],
        maps[i]['note'],
      );
    });
  }
}
