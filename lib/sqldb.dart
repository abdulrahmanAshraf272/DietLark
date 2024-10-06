import 'package:sqflite/sqflite.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:food_app/hold_values.dart';

class SqlDb {
  static Database? _db; //? that mean the variable can exept null value.

  //StackOverFlow method
  //SqlDb._privateConstructor();
  //static final SqlDb instance = SqlDb._privateConstructor();
  //static Database _database;
  /////////

  Future<Database?> get db async {
    //in case if the database does not initiated.
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  //if you want to change something on the database structure
  //change use _onUpdate method and increase the number of version.
  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mydiet.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    print("onUpgrade =================================");
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
  }

  //This function will be used only ONE Time, when creating the database.
  //if you want to change something in the database you can
  //use -_onUpgrade method , and that is better or
  //delete the data cash of the application.
  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "notes" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" TEXT ,
  "desc" TEXT,
  "image" TEXT,
  "amount" INTEGER,
  "amountType" INTEGER,
  "calories" INTEGER,
  "protein" REAL,
  "fat" REAL,
  "carb" REAL,
  "mealNo" INTEGER
)
''');
    print("onCreate =============================");
  }

  readData(String sql) async {
    //Without ! in mydb! will be error because that the condition of
    //Database? is that be null and that is not ok in methods
    //so, ! means => the value will not be null in my responsibilty.
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    //Without ! in mydb! will be error because that the condition of
    //Database? is that be null and that is not ok in methods
    //so, ! means => the value will not be null in my responsibilty.
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  addFoodToMyDiet(
      String title,
      String description,
      String image,
      int amount,
      int amountType,
      int calories,
      double protein,
      double fat,
      double carb,
      int mealNo) async {
    String sql = '''INSERT INTO ${HoldValues.DATABASE_NAME} 
      (${HoldValues.NAME}, ${HoldValues.DESC}, ${HoldValues.IMAGE}, ${HoldValues.AMOUNT}, ${HoldValues.AMOUNT_TYPE}, ${HoldValues.CALORIES}, ${HoldValues.PROTEIN}, ${HoldValues.FAT}, ${HoldValues.CARB}, ${HoldValues.MEAL_NO}) 
      VALUES ('${title}', '${description}', '${image}', '${amount}', '${amountType}', '${calories}', '${protein}', '${fat}', '${carb}', '${mealNo}')
    ''';

    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    //Without ! in mydb! will be error because that the condition of
    //Database? is that be null and that is not ok in methods
    //so, ! means => the value will not be null in my responsibilty.
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  editFoodAmount(int id, int newAmount, int calories, double protein,
      double carb, double fat) async {
    String sql = '''UPDATE ${HoldValues.DATABASE_NAME} SET
    amount = $newAmount ,
    calories = $calories ,
    protein  = $protein ,
    carb = $carb ,
    fat = $fat
    WHERE id = $id
    ''';
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    //Without ! in mydb! will be error because that the condition of
    //Database? is that be null and that is not ok in methods
    //so, ! means => the value will not be null in my responsibilty.
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  deleteAllMeals() async {
    //Without ! in mydb! will be error because that the condition of
    //Database? is that be null and that is not ok in methods
    //so, ! means => the value will not be null in my responsibilty.

    final sql = "DELETE FROM notes";
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  //Delete the database.
  myDeleteDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mydiet.db');
    await deleteDatabase(path);
  }
}
