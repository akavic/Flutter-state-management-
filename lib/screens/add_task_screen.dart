import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/model/task.dart';
import 'package:state_management_examples/components/task_data.dart';

/** this is where the bottom sheet is styyled and **/


class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    String newTaskTitle; // the name of the new task

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.lightBlueAccent),
            ),
            TextField(
              textAlign: TextAlign.center, //align cursor to cneter
              autocorrect: true,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent)
                )
              ),
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (value) {
                //print(value); // will show the text being dynamically changed
                newTaskTitle=value;
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                //going to add the data to the list
                Provider.of<TaskData>(context).addTask(Task(name:newTaskTitle));
                Navigator.pop(context); //close the bottom sheet once clicked
              },
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
