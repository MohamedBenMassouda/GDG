import 'package:flutter/material.dart';
import 'package:to_do_app_event/to_do.dart';
import 'package:to_do_app_event/to_do_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<ToDo> todos = [
    ToDo(title: 'Buy milk'),
    ToDo(title: 'Buy eggs'),
    ToDo(title: 'Buy bread'),
  ];
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _addTodo() {
    final newTodo = controller.text;

    if (newTodo.isEmpty || newTodo.trim().isEmpty) return;

    setState(() {
      todos.add(ToDo(title: controller.text));
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter a new todo",
                    ),
                    onSubmitted: (value) {
                      _addTodo();
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[20],
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ToDoTile(
                    toDo: todos[index],
                    onDelete: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
