import 'package:flutter/material.dart';

//esentailly callbacks check things learned
// ignore: must_be_immutable
class TaskTile extends StatelessWidget {

  final bool isChecked; // in sateless widget we cna't have properties that vary
  final String taskTitle;
  Function checkboxCallback;


  TaskTile({this.isChecked,this.taskTitle,this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //allows us to create a re-usable tile which has a property such as the title etc
      title: Text(taskTitle,
        style: TextStyle(
          // if false put a line through if not leave it
          decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
         onChanged: checkboxCallback,
      ),
    );
  }
}


// void checkboxCallback(bool checkboxState){
//
//   // so esentially onchanged in TaskCheckBox class will get updated by this method the ischecked
//   setState(() {
//     isChecked=checkboxState;
//   });
// }
