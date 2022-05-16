import 'package:munch_v4/models/ingredients.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'ingridients.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE IF NOT EXISTS ingredients(id INTEGER PRIMARY KEY, name TEXT NOT NULL, stars INTEGER, img TEXT)",
        );
      },
      version: 1,
    );
  }
 
  Future<int> insertUser(List<Ingredients> ingredients) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var ingredient in ingredients){
      result = await db.insert('ingredients', ingredient.toMap());
    }
    return result;
  }


  Future<List<Ingredients>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('ingredients');
    return queryResult.map((e) => Ingredients.fromMap(e)).toList();
  }
}