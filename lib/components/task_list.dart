import 'package:flutter/material.dart';
import 'package:state_management_examples/components/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/components/task_data.dart';
//this class hold the listview to display the task


class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // buildcontext contains the information that tells the children widget where the
    // parent is in the widget tree
    //the Tasklist is inside a container which is inside an exoanded widget which is then inside it's own column widget
    //you can use flutter inspector to check
    return Consumer<TaskData>(
      //instead of calling provider.of you can just wrap all three widgets in a consumer
        builder: (context, taskData, child){
          //this is how you set a widget as the parent of an ancestor
          //if you dont' have Consumer<taskData then there is an error
          return ListView.builder(itemBuilder: (context, index) {
            return TaskTile(
                taskTitle: taskData.tasks[index].name,
                // use widget to tap into the task object
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (checkBoxState) {
                  // toggle the tax at that paticular index
                  taskData.updateTask(taskData.tasks[index]);
                }
            );
          },
            itemCount: taskData.taskCount, //we tell it how many of the task tile we wnat it to build cause it doesn't know how many we have
          );
        });
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
