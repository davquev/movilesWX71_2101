import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class Orders extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get product_name => text()();
  TextColumn get price => text()();
}

@UseMoor(tables: [Orders])
class AppDatabase extends _$AppDatabase{
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));
  int get schemaVersion => 1;
}