import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/controller/todo_controller/todo_controller.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watchを使用しているのでstateが更新されると画面が更新される。
    final todoList = ref.watch(todoListNotifierProvider);

    // TodoListNotifierを使用する際は.notifierをつける
    final todoListState = ref.watch(todoListNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoページ'),
      ),
      body: ListView(
        children: [
          for (final todo in todoList)
            ListTile(
              tileColor: todo.completed ? Colors.blue : Colors.white,
              title: Text(todo.title),
              onTap: () => todoListState.toggel(todo.id),
              // watchせずにProviderを使う方法もある。後々学習。
              // onTap: () => 
              // ref.read(todoListNotifierProvider.notifier).toggel(todo.id),
            )
        ],
      ),
    );
  }
}
