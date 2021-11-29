import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/view/todo_list_page.dart';


void main() {
  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: TodoListPage(),
    );
  }
}
