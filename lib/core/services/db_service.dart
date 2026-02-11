import 'package:demo/core/consts/constants.dart';
import 'package:demo/features/student_feature/data/models/student_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlfliteService {
  SqlfliteService._privateConstructor();
  static final SqlfliteService instance = SqlfliteService._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'students.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Students Table
        await db.execute('''
CREATE TABLE $tableStudents(
  $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
  $columnName TEXT NOT NULL,
  $columnPhone TEXT NOT NULL,
  $columnEmail TEXT NOT NULL,
  $columnIsSynced INTEGER DEFAULT 0,
  $columnVersion INTEGER DEFAULT 1,
  $columnUpdatedAt TEXT
)
''');

        // Outbox Table
        await db.execute('''
CREATE TABLE $tableOutbox(
  $columnOutboxId INTEGER PRIMARY KEY AUTOINCREMENT,
  $columnOutboxTableName TEXT NOT NULL,
  $columnOutboxRowId INTEGER NOT NULL,
  $columnOutboxOperation TEXT NOT NULL,
  $columnOutboxPayload TEXT,
  $columnOutboxTimestamp TEXT NOT NULL
)
''');
      },
    );
  }

  /// Insert a new student
  Future<void> insertStudent(StudentModel student) async {
    final db = await database;

    final id = await db.insert(
      tableStudents,
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      tableOutbox,
      {
        columnOutboxTableName: tableStudents,
        columnOutboxRowId: id,
        columnOutboxOperation: 'INSERT',
        columnOutboxPayload: student.toMap().toString(),
        columnOutboxTimestamp: DateTime.now().toIso8601String(),
      },
    );
  }

  /// Update existing student
  Future<void> updateStudent(StudentModel student) async {
    final db = await database;

    await db.update(
      tableStudents,
      student.toMap(),
      where: '$columnId = ?',
      whereArgs: [student.id],
    );

    await db.insert(
      tableOutbox,
      {
        columnOutboxTableName: tableStudents,
        columnOutboxRowId: student.id,
        columnOutboxOperation: 'UPDATE',
        columnOutboxPayload: student.toMap().toString(),
        columnOutboxTimestamp: DateTime.now().toIso8601String(),
      },
    );
  }

  /// Delete student by ID
  Future<void> deleteStudent(int id) async {
    final db = await database;

    await db.delete(
      tableStudents,
      where: '$columnId = ?',
      whereArgs: [id],
    );

    await db.insert(
      tableOutbox,
      {
        columnOutboxTableName: tableStudents,
        columnOutboxRowId: id,
        columnOutboxOperation: 'DELETE',
        columnOutboxPayload: null,
        columnOutboxTimestamp: DateTime.now().toIso8601String(),
      },
    );
  }

  /// Get student by ID
  Future<StudentModel?> getStudent(int id) async {
    final db = await database;
    final maps = await db.query(
      tableStudents,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return StudentModel.fromMap(maps.first);
    }
    return null;
  }

  /// Get all students
  Future<List<StudentModel>> getAllStudents() async {
    final db = await database;
    final maps = await db.query(tableStudents);
    return maps.map((e) => StudentModel.fromMap(e)).toList();
  }

  /// Close database
  Future<void> closeDB() async {
    final db = _database;
    if (db != null && db.isOpen) {
      await db.close();
      _database = null;
    }
  }

  /// Get pending Outbox entries
  Future<List<Map<String, dynamic>>> getPendingOutbox() async {
    final db = await database;
    return await db.query(tableOutbox, orderBy: '$columnOutboxTimestamp ASC');
  }

  /// Clear outbox entry
  Future<void> clearOutboxEntry(int id) async {
    final db = await database;
    await db.delete(tableOutbox, where: '$columnOutboxId = ?', whereArgs: [id]);
  }
}
