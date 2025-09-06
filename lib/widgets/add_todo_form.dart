import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../models/todo.dart';

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({super.key});

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final _controller = TextEditingController();
  final _notesController = TextEditingController();
  DateTime? _selectedDate;
  DateTimeRange? _selectedTimeline;

  void _showToast(String msg, Color bgColor) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP, // harusnya di tengah atas
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  void _submit() {
    final title = _controller.text.trim();
    final notes = _notesController.text.trim();

    if (title.isEmpty) {
      _showToast("Judul tidak boleh kosong", Colors.redAccent);
      return;
    }

    final newTodo = Todo(
      title: title,
      notes: notes.isNotEmpty ? notes : null,
      deadline: _selectedDate,
      timeline: _selectedTimeline == null
          ? null
          : "${_selectedTimeline!.start.day}/${_selectedTimeline!.start.month} - "
            "${_selectedTimeline!.end.day}/${_selectedTimeline!.end.month}",
    );

    Provider.of<TodoProvider>(context, listen: false).addTodoObj(newTodo);
    _showToast("Tugas berhasil ditambahkan!", Colors.lightGreen);

    Navigator.pop(context);
  }

  Future<void> _pickDate() async {
    const mainColor = Color.fromARGB(255, 11, 41, 53);
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: mainColor,     // warna header & tombol
              onPrimary: Colors.white, // teks header
              onSurface: Colors.black, // warna tanggal
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickTimeline() async {
    const mainColor = Color.fromARGB(255, 11, 41, 53);
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: mainColor,     // warna header & tombol
              onPrimary: Colors.white, // teks header
              onSurface: Colors.black, // warna tanggal
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
              child: child,
            ),
          ),
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedTimeline = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    const mainColor = Color.fromARGB(255, 11, 41, 53);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tambah Tugas Baru",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              const SizedBox(height: 16),

              // Title
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: "Judul Tugas",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 12),

              // Notes
              TextField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: "Catatan (opsional)",
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),

              // Deadline
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Deadline"),
                subtitle: Text(
                  _selectedDate == null
                      ? "Belum dipilih"
                      : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                  style: const TextStyle(color: mainColor),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today, color: mainColor),
                  onPressed: _pickDate,
                ),
              ),
              const Divider(),

              // Timeline
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Timeline"),
                subtitle: Text(
                  _selectedTimeline == null
                      ? "Belum dipilih"
                      : "${_selectedTimeline!.start.day}/${_selectedTimeline!.start.month} "
                        "- ${_selectedTimeline!.end.day}/${_selectedTimeline!.end.month}",
                  style: const TextStyle(color: mainColor),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.timeline, color: mainColor),
                  onPressed: _pickTimeline,
                ),
              ),
              const Divider(),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(foregroundColor: mainColor),
                    child: const Text("Batal"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Tambah"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
