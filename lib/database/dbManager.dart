import 'dart:async';
import 'package:flutterapi/model/addCanvasRate.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/Planets.dart';
import '../model/addCanvasModel.dart';
import '../model/addSettingData.dart';

class DbManager {
  late Database _database;

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "calculation.db"),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE model(id INTEGER PRIMARY KEY autoincrement, area TEXT, canvas TEXT)",
          );
          await db.execute(
            "CREATE TABLE canvas(id INTEGER PRIMARY KEY autoincrement, canvasrate TEXT)",
          );
          await db.execute(
            "CREATE TABLE setting(id INTEGER PRIMARY KEY autoincrement, meter TEXT, frame TEXT, work TEXT, rate TEXT)",
          );
        });
    return _database;
  }

  Future<int> insertPlanets(List<AddCanvasModel> planets) async {
    int result = 0;
    final Database db = await openDb();
    for (var planet in planets) {
      result = await db.insert('model', planet.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return result;
  }

  Future<int> insertCanvasRate(AddCanvasRate addCanvasrate) async {
    int result = 0;
    final Database db = await openDb();
    result = await db.insert('canvas', addCanvasrate.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<int> insertsettingdata(List<AddSettingData> setting) async {
    int result = 0;
    final Database db = await openDb();
    for (var settingData in setting) {
      result = await db.insert('setting', settingData.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return result;
  }

  // retrieve data
  Future<List<AddSettingData>> getSettingData() async {
    final Database db = await openDb();
    var dbTable = "setting";
    var result = await db.rawQuery("SELECT * FROM $dbTable");
    return result.map((e) => AddSettingData.fromMap(e)).toList();
  }


  // retrieve data
  Future<List<AddCanvasModel>> retrievePlanets() async {
    final Database db = await openDb();
    var dbTable = "model";
    var result = await db.rawQuery("SELECT * FROM $dbTable");
    return result.map((e) => AddCanvasModel.fromMap(e)).toList();
  }

  Future<String> getCurrencyRates(int  id) async {
    String rate ;
    final Database db = await openDb();
    List<Map<String, dynamic>> lg =  await db.rawQuery("SELECT canvasrate FROM canvas WHERE id = '$id'");
       var map1 = Map.fromIterable(lg, key: (e) => e.canvasrate);
        print(map1);
        if (lg.length > 0) {
      for (var element in lg) {
       print("Value"+element.entries.toString())  ;
      }
      print("In the login List : "+ lg[0].toString());
      rate = lg[0].toString();
    } else {
      rate = lg[0].toString();
    }
    return rate;
  }
}