import 'dart:io';
import 'package:all_hadis/model/chapter_model.dart';
import 'package:all_hadis/model/hadith_model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/books_model.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'hadith_db.db');

    // Check if the database exists
    if (await databaseExists(path)) {
      return await openDatabase(path);
    } else {
      // Copy the database from assets if it doesn't exist
      ByteData data = await rootBundle.load(join('assets', 'hadith_db.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      return await openDatabase(path);
    }
  }

  Future<List<Books>> getBooksList() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query('books');
    return List.generate(maps.length, (i) {
      return Books(
        id: maps[i]['id'],
        title: maps[i]['title'],
        abvrCode: maps[i]['abvr_code'],
      );
    });
  }

  Future<List<Chapter>> getChapterList() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query('chapter');
    return List.generate(maps.length, (i) {
      return Chapter(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    });
  }

  Future<List<Hadith>> getHadithList() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query('hadith');
    return List.generate(maps.length, (i) {
      return Hadith(
        hadithId: maps[i]['hadith_id'],
        narrator: maps[i]['narrator'],
        bn: maps[i]['bn'],
        ar: maps[i]['ar'],
        note: maps[i]['note'],
        grade: maps[i]['grade'],
        gradeColor: maps[i]['grade_color'],
      );
    });
  }

  Future<List<Map<String, dynamic>>> getSections() async {
    Database? db = await database;
    return await db!.query('section', columns: ['number', 'title', 'preface']);
  }

}