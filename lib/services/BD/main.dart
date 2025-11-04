import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;
  final String tableCountry = "catalogs";

  DatabaseService._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('testapi.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableCountry (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name_common TEXT NOT NULL,
      name_official TEXT NOT NULL,
      capital TEXT,
      currencies TEXT,
      native_names TEXT
    )
    ''');
  }

  Future<int> insertCountry(CountryModel catalog) async {
    final db = await database;
    try {
      return await db.insert(tableCountry, catalog.toMap());
    } catch (e) {
      return 0;
    }
  }

  Future<List<CountryModel>> selectLocalCountries(String type) async {
    final db = await database;
    final result = await db.query(
      tableCountry,
      //where: "type = ?",
      // whereArgs: [type],
    );

    return result.map((map) => CountryModel.fromMap(map)).toList();
  }

  Future<int> deleteAllCatalogs(int id) async {
    final db = await database;
    return await db.delete(tableCountry, where: "id = ?", whereArgs: [id]);
  }
}
