import 'package:flutter/material.dart';

import 'custom_elevated_buttom.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });
  final TextEditingController? controller;
  final void Function()? onSave;
  final void Function()? onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: 'Add a new task',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomElevatedButtom(
                  txt: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomElevatedButtom(
                  txt: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
