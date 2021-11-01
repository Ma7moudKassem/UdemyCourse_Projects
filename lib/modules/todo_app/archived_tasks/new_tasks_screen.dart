import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/shared/components/components.dart';
import 'package:kassem_app/shared/cubit/cubit.dart';
import 'package:kassem_app/shared/cubit/states.dart';

class ArchivedTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppState>(
        builder: (context , state){

        var tasks = AppCubit.get(context).archiveTasks;
        return tasksBuilder(tasks: tasks);
        },

        listener:(context , state)
        {

        }
    );
  }
}
