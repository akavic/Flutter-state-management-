/***ignore this class it doesn't do anything just mess doing some things**/
import 'package:state_management_examples/model/task.dart';
////thiswhat i was doing here can be done much easier with the provider class vidoe 205-207
//https://wipro.udemy.com/course/flutter-bootcamp-with-dart/learn/lecture/15785428#questions

class SharedTaskList{

  static List<Task> tasks = [
    Task(name: 'Call Julie'),
    Task(name: 'buy egg'),
    Task(name: 'buy david present'),
    Task(name: 'buy car'),
  ];

  void add(String taskName){
    tasks.add(Task(name: taskName));
  }

  int taskLength(){
    return tasks.length;
  }

  String taskNameIndex(int x){
    return tasks[x].name;
  }
  bool taskBoolIndex(int x){
    return tasks[x].isDone;
  }

  void toggleDone(int x){
     tasks[x].isDone= true;

  }


}