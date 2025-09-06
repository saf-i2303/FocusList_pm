import 'package:flutter/foundation.dart';
import '../models/todo.dart';

class TodoProvider extends ChangeNotifier {
  // List buat nampung semua todo
  final List<Todo> _todos = [];

 
  List<Todo> get todos => _todos;

  // Tambah todo baru dengan detail
  void addTodo(
    String title, {
    String? notes,
    DateTime? deadline,
    String? timeline,
  }) {
    _todos.add(
      Todo(
        title: title,
        notes: notes,
        deadline: deadline,
        timeline: timeline,
      ),
    );
    notifyListeners(); 
  }

  
  void addTodoObj(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  // Hapus todo berdasarkan index
  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  // Ubah status todo (selesai / belum)
  void toggleTodoStatus(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }
}
