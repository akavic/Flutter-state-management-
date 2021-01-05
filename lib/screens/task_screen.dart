import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/components/task_list.dart';
import 'package:state_management_examples/components/task_data.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Widget buildBottomSheet(BuildContext context) {
    //it will return what we want to show in our borrom sheet
    //single child scroll view is what we use to make the add task screen sit above the keyboard
    return SingleChildScrollView(
        child: Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: AddTaskScreen(),
    ));
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
                '${Provider.of<TaskData>(context).taskCount}Task',
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
            child: TaskList(), //display task
          ),
        ),
      ]),
    );
  }
}
