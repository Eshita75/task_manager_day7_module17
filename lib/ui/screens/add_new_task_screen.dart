import 'package:flutter/material.dart';
import 'package:task_manager_day7_module17/ui/widgets/background_widget.dart';
import 'package:task_manager_day7_module17/ui/widgets/profile_appbar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(context),
      body:  BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(
                    hintText: 'Title'
                  ),
                ),

                SizedBox(
                  height: 8,
                ),

                TextFormField(
                  controller: _descriptionTEController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      hintText: 'Description'
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                ElevatedButton(onPressed: (){}, child: Text('Add'))
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
