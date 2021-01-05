/**import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management_examples/components/task_list.dart';
import 'package:state_management_examples/components/task_tile.dart';
import 'package:state_management_examples/model/task.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  List<Task> tasks = [
    Task(name: 'Call Julie'),
    Task(name: 'buy egg'),
    Task(name: 'buy david present'),
    Task(name: 'buy car'),
  ];

  Widget buildBottomSheet(BuildContext context) {
    //it will return what we want to show in our borrom sheet
    //single child scroll view is what we use to make the add task screen sit above the keyboard
    return SingleChildScrollView(child: Container(
        padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
        child: AddTaskScreen((newTaskTitle){
          setState(() {
            print(newTaskTitle); // prints task sent from add_task_screen.art
            tasks.add(Task(name:newTaskTitle ));
          });
          Navigator.pop(context); //close bottom sheet as soon as task is added
        })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //we want ot slide up somethng that allows us to input a new task
          showModalBottomSheet(
            context: context,
            builder: buildBottomSheet,
            isScrollControlled: true, // makes the modal take up the full screen
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding:
          EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.list,
                  size: 30.0,
                  color: Colors.lightBlueAccent,
                ),
                backgroundColor: Colors.white,
                radius: 30.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Todey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${tasks.length} Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: TaskList(tasks), // passing the task into the task list calss
          ),
        ),
      ]),
    );
  }
}
**/