# TodoList - Flutter App

## Deskripsi Aplikasi
Halo!  
Ini adalah aplikasi **Todo List sederhana** yang dibuat menggunakan Flutter.  
Dengan aplikasi ini, kamu bisa:

- Menambahkan Todo baru
- Menandai Todo yang sudah selesai
- Menghapus Todo
- Melihat splash screen saat aplikasi dibuka
- Melihat halaman About sederhana

Aplikasi ini menggunakan **Provider** sebagai state management, supaya perubahan Todo langsung terlihat di tampilan aplikasi.

---

## Struktur Aplikasi (Widget Tree)


**Penjelasan singkat:**

- **SplashScreen**: Layar pembuka saat aplikasi dijalankan  
- **HomeScreen**: Tempat daftar Todo ditampilkan + tombol untuk tambah Todo  
- **AddTodoForm**: Dialog untuk menambahkan Todo baru  
- **TodoTile**: Widget untuk setiap item Todo (ada teks, checkbox, dan tombol hapus)  
- **AboutScreen**: Halaman info singkat tentang aplikasi  

---

## State Management
- Menggunakan **Provider (`ChangeNotifierProvider`)**  
- Alasan pakai Provider:
  - Mudah dipelajari dan sesuai dokumentasi Flutter  
  - Memisahkan logika data dari tampilan → kode lebih rapi  
  - Cocok untuk aplikasi skala kecil seperti ini  

---

## Cara Menjalankan Aplikasi
1. Pastikan Flutter sudah terinstall di komputer/laptop kamu  
2. Buka proyek ini di **VS Code** atau **Android Studio**  
3. Jalankan perintah berikut di terminal:
```bash
flutter pub get
flutter run

lib/
 ├─ main.dart
 ├─ models/todo.dart
 ├─ providers/todo_provider.dart
 ├─ screens/
 │   ├─ home_screen.dart
 │   ├─ about_screen.dart
 │   └─ splash_screen.dart
 └─ widgets/
     ├─ add_todo_form.dart
     └─ todo_tile.dart
