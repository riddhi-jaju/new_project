import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo_item.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    super.key,
    required this.todoItem,
    required this.onCheckboxToggle,
    required this.onDelete,
  });
  final TodoItem todoItem;
  final Function(bool) onCheckboxToggle;
  final Function() onDelete;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Item"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 114, 125),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                widget.onDelete();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "Delete",
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 114, 125),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            leading: Checkbox(
              value: widget.todoItem.isChecked,
              onChanged: (bool? value) {
                if (value != null) {
                  widget.onCheckboxToggle(value);
                }
              },
              activeColor: const Color.fromARGB(255, 2, 114, 125),
            ),
            title: Text(
              widget.todoItem.title,
              style: TextStyle(
                decoration: widget.todoItem.isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
