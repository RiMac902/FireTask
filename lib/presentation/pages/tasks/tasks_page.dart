import 'package:fire_task/domain/entities/task_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/task/task_bloc.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_view.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              context.read<TaskBloc>()..add(const TaskEvent.getTasks()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // TODO: Navigate to create task page
              },
            ),
          ],
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder:
              (context, state) => switch (state) {
                Initial() => const SizedBox(),
                Loading() => const LoadingIndicator(),
                Loaded(:final List<TaskEntity> tasks) => _TasksList(
                  tasks: tasks,
                ),
                TaskLoaded(:final TaskEntity task) => Text('$task'),
                Success(:final String message) => Text(message),
                Error(:final String message) => ErrorView(message: message),
              },
        ),
      ),
    );
  }
}

class _TasksList extends StatelessWidget {
  final List<TaskEntity> tasks;

  const _TasksList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<TaskBloc>().add(TaskEvent.deleteTask(task.id));
            },
          ),
          onTap: () {
            // TODO: Navigate to task details page
          },
        );
      },
    );
  }
}
