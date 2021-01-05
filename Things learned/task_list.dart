
/**
 before i used provider class to manage state  **/
/**
import 'package:flutter/material.dart';
import 'package:state_management_examples/components/task_tile.dart';
import 'package:state_management_examples/model/task.dart';
import 'package:state_management_examples/screens/task_screen.dart';

class TaskList extends StatefulWidget {
  //this class hiold the listview to dusplay the task

  final List <Task> tasks;

  TaskList(this.tasks);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {



  @override
  Widget build(BuildContext context) {
    // buildcontext contains the information that tells the children widget where the
    // parent is in the widget tree
    //the Tasklist is inside a container which is inside an exoanded widget which is then inside it's own column widget
    //you can use flutter inspector to check
    return ListView.builder(itemBuilder: (context, index) {
      return TaskTile(
          taskTitle: widget.tasks[index].name, // use widget to tap into the task object
          isChecked: widget.tasks[index].isDone,
          checkboxCallback:  (checkBoxState){
            setState(() {
              widget.tasks[index].toggleDone();
            });
          }
      );
    },
      itemCount:widget.tasks.length, //we tell it how many of the task tile we wnat it to build cause it doesn't know how many we have
    );
  }
}


//instead of doing this you can use listview.builder
// ListView(
// children: [
// TaskTile(taskTitle: tasks[0].name,isChecked: tasks[0].isDone),
// TaskTile(taskTitle: tasks[1].name,isChecked: tasks[1].isDone),
// TaskTile(taskTitle: tasks[2].name,isChecked: tasks[3].isDone),
// TaskTile(taskTitle: tasks[4].name,isChecked: tasks[5].isDone),
// ],
// );
**/