import 'package:flutter/material.dart';

import 'custom_elevated_buttom.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: SizedBox(
        height: 125,
        child: Column(
          children: [
            const TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Add a new task',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomElevatedButtom(
                  txt: 'Save',
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomElevatedButtom(
                  txt: 'Cancel',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
