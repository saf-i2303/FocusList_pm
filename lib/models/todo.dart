class Todo {
  String title;       // Judul tugas
  bool isDone;        // Status selesai/belum

  String? notes;      // Catatan tambahan 
  DateTime? deadline; // Deadline 
  String? timeline;   // Timeline

  Todo({
    required this.title,
    this.isDone = false,
    this.notes,
    this.deadline,
    this.timeline,
  });
}
