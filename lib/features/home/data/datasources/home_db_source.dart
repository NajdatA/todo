import 'package:sqflite/sqflite.dart';
import 'package:meta/meta.dart';

class HomeDb {
  final Database database;

  HomeDb(this.database);

  Future<List<Map<String, dynamic>>> getTodoTasks() async {
    return await database.transaction<List<Map<String, dynamic>>>(
          (txn) async {
        final query = '''SELECT * FROM todo''';
        List<Map<String, dynamic>> list = await txn.rawQuery(query);
        print('krox $list');
        return list;
      },
    );
  }

  Future<Map<String, dynamic>> getTaskById({
    @required int id,
  }) async {
    return await database.transaction<Map<String, dynamic>>(
          (txn) async {
        final query = '''SELECT * FROM todo
          WHERE id = ?''';
        final result = await txn.rawQuery(query, [id]);
        return result.isNotEmpty ? result.first : null;
      },
    );
  }

  Future<Map<String, dynamic>> insertTask({
    @required String task,
  }) async {
    final taskId = await database.transaction(
          (txn) async {
        final query = '''INSERT INTO todo(
          task,
          date,
          is_finished
          ) VALUES(?, ?, ?)''';
        final x = await txn.rawInsert(
            query, [task, DateTime.now().toString(), 0]);
        return x;
      },
    );
    return await getTaskById(id: taskId);
  }

  Future<Map<String, dynamic>> updateTask({
    @required int id,
    @required bool isFinished,
  }) async {
    await database.transaction(
          (txn) async {
        final query = '''UPDATE todo 
          SET is_finished = ? 
          WHERE id = ?''';
        await txn.rawUpdate(query, [isFinished ? 1 : 0, id]);
      },
    );
    return await getTaskById(id: id);
  }
}

Future<Database> initDb() async {
  return await openDatabase(
    'todo_db.db',
    version: 1,
    onCreate: (Database db, int version) async {
      print('creating todo table');
      String createItemTableQuery =
      '''CREATE TABLE todo(
            id INTEGER PRIMARY KEY,
            task TEXT, 
            date TEXT, 
            is_finished INTEGER)''';
      await db.execute(createItemTableQuery);
      print('table created successfully');
    },
  );
}