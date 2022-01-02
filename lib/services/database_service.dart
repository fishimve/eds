// ignore_for_file: unnecessary_string_escapes

import 'package:eds_test/models/user.dart';
import 'package:sqflite/sqflite.dart';

const String dbName = 'eds.db';
const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
const textType = 'TEXT NOT NULL';
// const boolType = 'BOOLEAN NOT NULL';
// const integerType = 'INTEGER NOT NULL';

class DatabaseService {
  static late Database? _database;

  Future initialiseDb() async {
    _database = await openDatabase(
      dbName,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $usersTableName ( 
      ${UsersTable.id} $idType, 
      ${UsersTable.name} $textType, 
      ${UsersTable.username} $textType, 
      ${UsersTable.email} $textType, 
      ${UsersTable.phone} $textType, 
      ${UsersTable.website} $textType);
    ''');

    await db.execute('''
    CREATE TABLE $addressesTableName(
      ${UsersTable.id} $idType, 
      street $textType,
      suite $textType,
      city $textType,
      zipcode $textType);
    ''');

    await db.execute('''
    CREATE TABLE $geoTableName(
      ${UsersTable.id} $idType, 
      lat $textType,
      lng $textType);
    ''');

    await db.execute('''
    CREATE TABLE $companiesTableName(
      ${UsersTable.id} $idType, 
      name $textType,
      bs $textType,
      catchPhrase $textType);
    ''');
  }

  Future<List<User>> queryUsers() async {
    final List<Map> usersData = await _database!.query(usersTableName);
    final List<Map> addressesData = await _database!.query(addressesTableName);
    final List<Map> geoData = await _database!.query(geoTableName);
    final List<Map> companiesData = await _database!.query(companiesTableName);

    var users = <User>[];

    for (var i = 0; i < usersData.length; i++) {
      var user = Map.from(usersData[i]);
      var geo = Map.from(geoData[i]);
      var address = Map.from(addressesData[i]);
      var company = Map.from(companiesData[i]);
      geo.remove('id');
      address.remove('id');
      company.remove('id');
      address['geo'] = geo;
      user['address'] = address;
      user['company'] = company;
      users.add(User.fromMap(user));
    }
    return users;
  }

  Future insertUser(User user) async {
    try {
      await _database!.rawInsert('''
            INSERT INTO $usersTableName (name, username, email, phone, website) VALUES (\'${user.name}\', \'${user.username}\', \'${user.email}\', \'${user.phone}\', \'${user.website}\');         
            ''');
      await _database!.rawInsert('''
          INSERT INTO $addressesTableName (street, suite, city, zipcode) VALUES (\'${user.address.street}\', \'${user.address.suite}\', \'${user.address.city}\', \'${user.address.zipcode}\');
            ''');
      await _database!.rawInsert('''
          INSERT INTO $geoTableName (lat, lng) VALUES (\'${user.address.geo['lat']}\', \'${user.address.geo['lng']}\');
            ''');
      await _database!.rawInsert('''
          INSERT INTO $companiesTableName (name, catchPhrase, bs) VALUES (\'${user.company.name}\', \'${user.company.catchPhrase}\', \'${user.company.bs}\');
            ''');
    } catch (e) {
      throw Exception('Couldn\'t insert into db: $e');
    }
  }

  Future<void> dropUsers() async {
    await _database!.delete(usersTableName);
  }

  Future<void> deleteDb() async {
    final dbPath = await getDatabasesPath();
    await deleteDatabase(dbPath);
  }

  Future<List<String>> showTables() async {
    var tableNames = (await _database!
            .query('sqlite_master', where: 'type = ?', whereArgs: ['table']))
        .map((row) => row['name'] as String)
        .toList(growable: false)
      ..sort();
    return tableNames;
  }
}


      // final userId = await _database!.insert(
      //   usersTableName,
      //   user.toMap(),
      //   conflictAlgorithm: ConflictAlgorithm.replace,
      // );