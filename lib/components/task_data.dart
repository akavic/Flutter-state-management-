import 'package:flutter/foundation.dart';
import 'package:state_management_examples/model/task.dart';
import 'dart:collection';


class TaskData extends ChangeNotifier{
  //so esentially were using a provider class to pass data from this class to another class without the need
  //of passing it class by class
  //rememeber to get provider dependancy
  //provider: ^4.3.2+3
  List<Task> _tasks = [
    Task(name: 'Call karl'),
    Task(name: 'buy egg'),
    Task(name: 'buy david present'),
    Task(name: 'buy car'),
  ];

  void addTask(Task task){
    // you cant just tasp into the task list and add you have to do it via a method and add notifylistner after
    _tasks.add(task);
    notifyListeners(); // this notifies all the classes that are using the task list that it has been updated
  }

  int get taskCount{
    return _tasks.length;
  }

  UnmodifiableListView <Task> get tasks{
    // unmodifiable listvoew esentoally a diferent data type so it make sure the list can't be modified
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners(); // update the widget that are listening to that paticular task

  }


}