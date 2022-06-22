import 'package:flutter/material.dart';
import 'package:safipet/db/animal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class AnimalesBD {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'mascotas.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE mascotas (id INTEGER PRIMARY KEY, especie TEXT, nombre TEXT, raza TEXT, sexo TEXT, peso VARCHAR (3), color TEXT DEFAULT "negro", '
          ' vacunas TEXT, medicaciones TEXT, esterilizado TEXT, microchip INTEGER)');
    }, version: 1);
  }

  //creo el CRUD pero la BD

  static Future<Future<int>> insert(Mascota mascota) async {
    Database db = await _openDB();

    return db.insert("mascotas", mascota.toMaps(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> delete(Mascota mascota) async {
    Database db = await _openDB();

    return db.delete("mascotas", where: "id= ?", whereArgs: [mascota.id]);
  }

  static Future<int> update(Mascota mascota) async {
    Database db = await _openDB();

    return db.update("mascotas", mascota.toMaps(),
        where: "id= ?", whereArgs: [mascota.id]);
  }

  static Future<List<Mascota>> mascotas() async {
    Database db = await _openDB();

    final List<Map<String, dynamic>> mascotasMap = await db.query("mascotas");

    for(var n in mascotasMap){
      print("___"+n['nombre']);
    }

    return List.generate(
        mascotasMap.length,
        (i) => Mascota(
              //se convierte en objeto
              id: mascotasMap[i]['id'],
              especie: mascotasMap[i]['especie'],
              nombre: mascotasMap[i]['nombre'],
              raza: mascotasMap[i]['raza'],
              sexo: mascotasMap[i]['sexo'],
              peso: mascotasMap[i]['peso'],
              color: mascotasMap[i]['color'],
              vacunas: mascotasMap[i]['vacunas'],
              medicaciones: mascotasMap[i]['medicaciones'],
              esterilizado: mascotasMap[i]['esterilizado'],
              microchip: mascotasMap[i]['microchip'],
            ));
  }
}
