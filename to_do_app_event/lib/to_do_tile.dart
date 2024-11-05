import 'package:flutter/material.dart';
import 'package:to_do_app_event/to_do.dart';

class ToDoTile extends StatefulWidget {
  final ToDo toDo;
  final Function onDelete;

  const ToDoTile({
    super.key,
    required this.toDo,
    required this.onDelete,
  });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            widget.toDo.title,
            style: TextStyle(
              fontSize: 18,
              color: widget.toDo.isDone ? Colors.purple : Colors.black,
              decoration:
                  widget.toDo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: widget.toDo.isDone,
                onChanged: (value) {
                  setState(() {
                    widget.toDo.toggleDone();
                  });
                },
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                child: const Icon(Icons.delete),
                onTap: () => widget.onDelete(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
