import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../model/note/note.dart';

class HelperSql {
  static Database? _db;

  //getter to initialize database if there's no initial database
  static Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  //initialize DB
  static initialDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Notes.db");
    var myDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDB;
  }

  //Create DB
  static _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Notes(ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Description TEXT NOT NULL,Title TEXT NOT NULL,Date TEXT NOT NULL)');
  }

  //Insert in DB
  static insertDB(Map<String, dynamic> data) async {
    Database? dbClient = await db;
    var result = await dbClient!.insert("Notes", data);
    return result;
  }

  //Delete all of DB
  static deleteDB(int id) async {
    Database? dbClient = await db;
    var result = await dbClient!.rawUpdate("DELETE FROM Notes WHERE ID = $id");
    return result;
  }

  //Update in DB
  static updateDB(int id, String title, String description, String date) async {
    Database? dbClient = await db;
    var result = await dbClient?.rawUpdate(
        "Update Notes SET Title = '$title', Description = '$description', Date = '$date' Where ID = $id");

    return result;
  }

  //Get only one row in DB by id & title
  static getOneRowDB(int id, String title, String description) async {
    Database? dbClient = await db;
    var result = await dbClient!.query("Notes", where: "ID = $id");

    return result;
  }

  //Get all rows in DB
  static Future<List<NotesModel>> getAllRowsDB() async {
    List<NotesModel> noteList = [];
    Database? dbClient = await db;
    var result = await dbClient!.query("Notes");
    for (var note in result) {
      noteList.add(NotesModel(
          id: note["ID"],
          description: note["Description"],
          title: note["Title"],
          date: note["Date"]));
    }
    return noteList;
  }
}
