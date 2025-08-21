

import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import 'dart:async';


class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = "infoclin.db";

    String dbPath = join(path, dbName);
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }

  Future<void> onCreate(Database db, int version) async {
    String sql;

    Future<void> onCreate(Database db, int version) async {
      String sql;

      // Tabela Cancer
      sql = '''
  CREATE TABLE Cancer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    Formadiagnostico TEXT,
    nivelGravidade TEXT
  );
  ''';
      await db.execute(sql);

      // Tabela Sintoma
      sql = '''
  CREATE TABLE Sintoma (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    nivelUrgencia TEXT
  );
  ''';
      await db.execute(sql);

      // Tabela Tratamento
      sql = '''
  CREATE TABLE Tratamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    tipo TEXT,
    descricao TEXT,
    efeitosColaterais TEXT
  );
  ''';
      await db.execute(sql);

      // ------------ INSERÇÕES ------------

      // CÂNCERES
      sql = '''
  INSERT INTO Cancer (nome, Formadiagnostico, nivelGravidade) 
  VALUES 
    ('Câncer de Mama', 'Mamografia, ultrassonografia, biópsia', 'Alto'),
    ('Câncer de Pulmão', 'Tomografia, broncoscopia, biópsia', 'Crítico'),
    ('Câncer de Próstata', 'PSA, toque retal, biópsia', 'Moderado'),
    ('Câncer de Pele', 'Dermatoscopia, biópsia de pele', 'Baixo'),
    ('Câncer de Intestino', 'Colonoscopia, exame de fezes, biópsia', 'Alto');
  ''';
      await db.execute(sql);

      // SINTOMAS
      sql = '''
  INSERT INTO Sintoma (nome, descricao, nivelUrgencia)
  VALUES 
    ('Tosse Persistente', 'Tosse que dura mais de 3 semanas', 'Alta'),
    ('Nódulo na Mama', 'Caroço detectado ao toque', 'Alta'),
    ('Sangue nas Fezes', 'Presença de sangue visível ou oculto', 'Alta'),
    ('Lesões na Pele', 'Feridas que não cicatrizam', 'Média'),
    ('Dor ao Urinar', 'Desconforto ou queimação', 'Média'),
    ('Perda de Peso Inexplicada', 'Emagrecimento sem dieta', 'Alta'),
    ('Fadiga Persistente', 'Cansaço prolongado e sem causa aparente', 'Média');
  ''';
      await db.execute(sql);

      // TRATAMENTOS
      sql = '''
  INSERT INTO Tratamento (nome, tipo, descricao, efeitosColaterais)
  VALUES 
    ('Quimioterapia', 'Medicamentoso', 'Uso de medicamentos para destruir células cancerígenas', 'Náusea, Queda de cabelo, Fadiga'),
    ('Radioterapia', 'Físico', 'Radiação para eliminar células tumorais', 'Irritação na pele, Fadiga'),
    ('Cirurgia', 'Invasivo', 'Remoção física do tumor', 'Dor, Risco de infecção'),
    ('Imunoterapia', 'Biológico', 'Estimula o sistema imunológico a combater o câncer', 'Febre, Fadiga, Dor muscular'),
    ('Terapia Hormonal', 'Hormonal', 'Bloqueio de hormônios que alimentam o câncer', 'Alterações de humor, Fadiga');
  ''';
      await db.execute(sql);
    }
  }
}