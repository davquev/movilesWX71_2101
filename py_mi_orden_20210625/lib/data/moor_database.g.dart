// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Order extends DataClass implements Insertable<Order> {
  final int id;
  final String product_name;
  final String price;
  Order({@required this.id, @required this.product_name, @required this.price});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Order(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      product_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name']),
      price:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || product_name != null) {
      map['product_name'] = Variable<String>(product_name);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      product_name: product_name == null && nullToAbsent
          ? const Value.absent()
          : Value(product_name),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      product_name: serializer.fromJson<String>(json['product_name']),
      price: serializer.fromJson<String>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product_name': serializer.toJson<String>(product_name),
      'price': serializer.toJson<String>(price),
    };
  }

  Order copyWith({int id, String product_name, String price}) => Order(
        id: id ?? this.id,
        product_name: product_name ?? this.product_name,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('product_name: $product_name, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(product_name.hashCode, price.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.product_name == this.product_name &&
          other.price == this.price);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> product_name;
  final Value<String> price;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.product_name = const Value.absent(),
    this.price = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    @required String product_name,
    @required String price,
  })  : product_name = Value(product_name),
        price = Value(price);
  static Insertable<Order> custom({
    Expression<int> id,
    Expression<String> product_name,
    Expression<String> price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product_name != null) 'product_name': product_name,
      if (price != null) 'price': price,
    });
  }

  OrdersCompanion copyWith(
      {Value<int> id, Value<String> product_name, Value<String> price}) {
    return OrdersCompanion(
      id: id ?? this.id,
      product_name: product_name ?? this.product_name,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product_name.present) {
      map['product_name'] = Variable<String>(product_name.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('product_name: $product_name, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  final GeneratedDatabase _db;
  final String _alias;
  $OrdersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _product_nameMeta =
      const VerificationMeta('product_name');
  GeneratedTextColumn _product_name;
  @override
  GeneratedTextColumn get product_name =>
      _product_name ??= _constructProductName();
  GeneratedTextColumn _constructProductName() {
    return GeneratedTextColumn(
      'product_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedTextColumn _price;
  @override
  GeneratedTextColumn get price => _price ??= _constructPrice();
  GeneratedTextColumn _constructPrice() {
    return GeneratedTextColumn(
      'price',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, product_name, price];
  @override
  $OrdersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'orders';
  @override
  final String actualTableName = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _product_nameMeta,
          product_name.isAcceptableOrUnknown(
              data['product_name'], _product_nameMeta));
    } else if (isInserting) {
      context.missing(_product_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Order.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $OrdersTable _orders;
  $OrdersTable get orders => _orders ??= $OrdersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orders];
}
