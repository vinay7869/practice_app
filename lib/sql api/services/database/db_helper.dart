import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper2 {
  static final DatabaseHelper2 _instance = DatabaseHelper2.internal();

  DatabaseHelper2.internal();

  factory DatabaseHelper2() => _instance;

  static Database? _db;

  Future<Database> get dbClient async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await onInit();
      return _db!;
    }
  }

  onInit() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'newDb');
    var ourPath = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
    return ourPath;
  }

  Map productTable = {
    "categories": '''
    CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY, name TEXT,
        image TEXT,
        creationAt TEXT,
        updatedAt TEXT)
        ''',

    //
    "products": '''CREATE TABLE IF NOT EXISTS products (id INTEGER PRIMARY KEY,
        title TEXT,
        price INTEGER,
        description TEXT,
        images TEXT,
        updatedAt TEXT,
        categoryId INTEGER,
        FOREIGN KEY (categoryId) REFERENCES categories (id))'''
  };

  onCreate(Database db, int version) async {
    for (var element in productTable.values) {
      db.execute(element).then((value) async {});
    }
  }

  Future<int> addProduct(Map<String, dynamic> product) async {
    try {
      final db = await dbClient;
      final res = await db.insert('products', product);
      log('Product added: $res');
      return res;
    } catch (e) {
      log("addProduct -->> ${e.toString()}");
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final db = await dbClient;
      final res = await db.query('products');
      log('Products fetched: $res');
      return res;
    } catch (e) {
      log('getProducts -->> ${e.toString()}');
      return [];
    }
  }
}
