import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 130,
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Add a new task',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
