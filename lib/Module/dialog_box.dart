import 'package:flutter/material.dart';
import 'package:todo/Module/my_button.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;


   DialogBox({super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple.shade600,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Get user input
            TextField(
              controller: controller,
          style: TextStyle(
            color: Colors.white,
          ),// Change the text color here
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Add a new task",
              ),

            ),
            // save buttons and cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

              // save button
              MyButton(text: "Save", onPressed: onSave),
              // cancel button
                const SizedBox(width: 8,),
              MyButton(text: "Cancel", onPressed: onCancel),
            ],)

          ],),
      ),
    );
  }
}
