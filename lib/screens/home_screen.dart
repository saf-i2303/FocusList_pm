import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/add_todo_form.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mainColor = Color.fromARGB(255, 11, 41, 53);
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        foregroundColor: Colors.white, // biar teks + icon putih
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.1),
        title: const Text(
          "FocusList",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
      body: todoProvider.todos.isEmpty
          ? const Center(
              child: Text(
                "Belum ada tugas.\nTambahkan dengan tombol +",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                return TodoItem(
                  todo: todo,
                  onToggle: () => todoProvider.toggleTodoStatus(index),
                  onDelete: () => todoProvider.removeTodo(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const AddTodoForm(),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
