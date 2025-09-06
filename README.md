# FocusList_pm

# 📋 TodoList - Flutter App

## 🎯 Tujuan
Aplikasi ini dibuat untuk memenuhi tugas Flutter dengan tujuan:

- Memahami perbedaan **Stateless** dan **Stateful Widget**
- Menerapkan **state management (Provider)** agar UI berubah secara reaktif
- Merancang **widget tree** yang rapi, terstruktur, dan mudah dibaca

---

## Deskripsi Aplikasi
Halo! 
Ini adalah aplikasi **Todo List sederhana** yang dibuat menggunakan Flutter.  
Dengan aplikasi ini, pengguna bisa:

- ➕ Menambahkan Todo baru  
- ✅ Menandai Todo yang sudah selesai  
- ❌ Menghapus Todo  
- 👋 Melihat **Splash Screen** saat aplikasi dibuka  
- ℹ️ Membuka halaman **About** sederhana  

Aplikasi ini menggunakan **Provider** sebagai state management, supaya setiap perubahan Todo langsung terlihat di tampilan aplikasi.

---

## Struktur Aplikasi (Widget Tree)

**Penjelasan singkat:**

- **SplashScreen** → Layar pembuka saat aplikasi dijalankan  
- **HomeScreen** → Menampilkan daftar Todo + tombol tambah Todo  
  - **ListView.builder** → menampilkan daftar Todo  
  - **TodoTile** (custom widget) → menampilkan 1 Todo (teks + checkbox + hapus)  
  - **AddTodoForm** (custom widget dialog) → form untuk menambahkan Todo baru  
- **AboutScreen** → Halaman info singkat tentang aplikasi  

---

## State Management
- Menggunakan **Provider (`ChangeNotifierProvider`)**  
- Alasan pakai Provider:
  - Mudah dipelajari dan sesuai dokumentasi Flutter resmi  
  - Memisahkan logika data dari tampilan → kode lebih rapi  
  - Cocok untuk aplikasi skala kecil seperti TodoList ini  

---

## Struktur Folder
lib/
├─ main.dart
├─ models/
│ └─ todo.dart
├─ providers/
│ └─ todo_provider.dart
├─ screens/
│ ├─ home_screen.dart
│ ├─ about_screen.dart
│ └─ splash_screen.dart
└─ widgets/
├─ add_todo_form.dart
└─ todo_tile.dart

## Demo Aplikasi

![Demo TodoList](https://github.com/saf-i2303/FocusList_pm/blob/main/iPhone-13-PRO-localhost-lxrblslhrg-yt9-ezgif.com-video-to-gif-converter.gif)



