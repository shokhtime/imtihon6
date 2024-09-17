import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:imtihon6/model/xarajat.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
part 'xarajat_event.dart';
part 'xarajat_state.dart';

class XarajatBloc extends Bloc<XarajatEvent, XarajatState> {
  Database? _database;

  XarajatBloc() : super(InitialStateXarajat()) {
    on<XarajatLoadEvent>(loadXarajat);
    on<XarajatAddEvent>(addXarajat);
    on<XarajatDeleteEvent>(onDeleteXarajat);
  }

  Future<void> loadXarajat(
    XarajatLoadEvent event,
    Emitter<XarajatState> emit,
  ) async {
    emit(LoadingStateXarajat());
    try {
      await initDb();
      final xarajat = await fetchXarajat();
      emit(LoadedStateXarajat(xarajat));
    } catch (e) {
      emit(ErrorStateXarajat('Failed to get todos'));
    }
  }

  Future<void> addXarajat(
    XarajatAddEvent event,
    Emitter<XarajatState> emit,
  ) async {
    if (_database == null) await initDb();
    await insertXarajat(
      event.xarajat.summa,
      event.xarajat.category,
      event.xarajat.time,
      event.xarajat.description,
    );
    add(XarajatLoadEvent());
  }

  Future<void> editXarajat(
    XarajatEditEvent event,
    Emitter<XarajatState> emit,
  ) async {
    await updateXarajat(
      event.xarajat.summa,
      event.xarajat.category,
      event.xarajat.time,
      event.xarajat.description,
    );
  }

  Future<void> onDeleteXarajat(
      XarajatDeleteEvent event, Emitter<XarajatState> emit) async {
    if (_database == null) await initDb();
    await deleteXarajat(event.id);
    add(XarajatLoadEvent());
  }

  Future<void> initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}/xarajat.db";
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE xarajatlar(id INTEGER PRIMARY KEY, summa FLOAT, category STRING, time DATETIME, comment STRING )",
        );
      },
    );
  }

  Future<List<Xarajat>> fetchXarajat() async {
    final List<Map<String, dynamic>> maps =
        await _database!.query('xarajatlar');
    return List.generate(maps.length, (i) {
      return Xarajat.fromMap(maps[i]);
    });
  }

  Future<void> insertXarajat(
    double summa,
    String category,
    DateTime time,
    String comment,
  ) async {
    await _database!.insert('xarajatlar', {
      'summa': summa,
      'category': category,
      'time': time,
      'comment': comment,
    });
  }

  Future<void> updateXarajat(
    double summa,
    String category,
    DateTime time,
    String comment,
  ) async {
    await _database!.update(
      'xarajat',
      {
        'summa': summa,
        'category': category,
        'time': time,
        'comment': comment,
      },
    );
  }

  Future<void> deleteXarajat(int id) async {
    await _database!.delete('xarajatlar', where: 'id=?', whereArgs: [id]);
  }
}
