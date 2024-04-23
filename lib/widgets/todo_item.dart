import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.textName,
    required this.val,
    required this.onChanged,
    required this.onPressed,
  });
  final String textName;
  final bool val;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(8),
              onPressed: onPressed,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: val,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                textName,
                style: TextStyle(
                  decoration:
                      val ? TextDecoration.lineThrough : TextDecoration.none,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
