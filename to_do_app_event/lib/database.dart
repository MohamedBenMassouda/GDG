import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:to_do_app_event/to_do.dart';

class ToDoDatabase {
  List<ToDo> todos = [];
  late File _file;

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    _file = File('${directory.path}/todos.json');

    if (await _file.exists()) {
      final json = await _file.readAsString();
      final List<dynamic> data = jsonDecode(json);
      todos = data.map((e) => ToDo.fromJson(e)).toList();
    } else {
      await _file.create();
    }
  }

  void add(ToDo todo) {
    todos.add(todo);
    save();
  }

  void reomve(ToDo todo) {
    todos.remove(todo);
    save();
  }

  void toggle(ToDo todo) {
    todo.toggleDone();
    save();
  }

  Future<void> save() {
    final json = jsonEncode(todos);
    return _file.writeAsString(json);
  }
}
