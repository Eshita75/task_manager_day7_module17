import 'package:flutter/material.dart';

import '../widgets/profile_appbar.dart';
import '../widgets/task_item.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index){
                return TaskItem();
              })
      ),
    );
  }
}
