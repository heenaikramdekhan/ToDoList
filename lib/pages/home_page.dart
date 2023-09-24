

import 'package:flutter/material.dart';
import 'package:todo/Module/dialog_box.dart';
import 'package:todo/Module/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // task controller
  final _controller= TextEditingController();
  // list of todo tasks
  List toDoList = [
    ["make tetorial", false],
    ["do exercise",false]
  ];

  // check box

  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1]= !toDoList[index][1];
    });

  }
  // save new task

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of (context).pop();

  }

  // create a new task
  void createNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop() ,
        );
      },
    );
  }
// delete task
  void deleteTask(int index){

    setState(() {
      toDoList.removeAt(index);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      appBar: AppBar(
        title: Text('To DO Tasks',
        style: TextStyle(
        color: Colors.black,
        ),
        ),
        backgroundColor: Color(0xFFC6A5FF),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask(context);
        },
        backgroundColor: Colors.purple.shade800, // Change the background color
        foregroundColor: Colors.black,
        child: Icon(Icons.add),

      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskname: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
            deleteFuntion: (context) => deleteTask(index),

          );
        },

      ),
    );
  }
}


