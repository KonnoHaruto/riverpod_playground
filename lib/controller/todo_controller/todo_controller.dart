import 'package:riverpod/riverpod.dart';
import 'package:riverpod_playground/model/todo.dart';


// StateNotifierを継承したclass.
// TodoのリストをStateに持ち、Todoを操作するクラス
class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([
    const Todo(id: '1a1a', title: '薪を焚べる'),
    const Todo(id: '1b1b', title: '釣竿をいなす'),
    const Todo(id: '1c1c', title: '電球を磨く'),
  ]);

  // 作成
  void add(Todo todo) {
    state = [...state, todo];
  }

  // 削除
  void delete(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  // 完了状態を操作
  void toggel(String todoId) {
    state = [
      for (final todo in state)
      if (todo.id == todoId)
        todo.copyWith(completed: !todo.completed)
      else 
        todo,
    ];
  }
}


// 作成したTodoListNotifierのProvider
// 状態を格納し、実装したメソッドを通じて状態を公開・操作できるProvider.
// StateProviderとの違いは状態を操作するメソッドをStateNotifierを継承したクラスに定義できること
final todoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});
