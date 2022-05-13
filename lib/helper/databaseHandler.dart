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
  Future<int> insertIngredients(List<IngredientsModel> ingredients) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var ingredient in ingredients){
      result = await db.insert('ingredients', ingredients.toMap());
    }
    return result;
  }
  Future<List<User>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }
}