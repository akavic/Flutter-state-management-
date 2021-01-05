import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/screens/task_screen.dart';

import 'components/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // we added change npotifier here so it at the highest point in the widget tree so everything below
      //can access the task_data.dart
      //context tells current position in the widget tree and the data that we want to pass
      //taskdata //very important you add this builder
      builder:(context)=>TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
