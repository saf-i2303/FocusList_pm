import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mainColor = Color.fromARGB(255, 11, 41, 53);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Aplikasi"),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hero Section
            const CircleAvatar(
              radius: 50,
              backgroundColor: mainColor,
              child: Icon(Icons.checklist_rounded, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              "FocusList",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Bikin hari kamu lebih produktif dengan mencatat & menyelesaikan tugas secara fokus ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),

            // Info Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person, color: mainColor),
                      title: Text("Dibuat oleh"),
                      subtitle: Text("Safina annaja"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.info, color: mainColor),
                      title: Text("Versi Aplikasi"),
                      subtitle: Text("1.0.0"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: mainColor),
                      title: Text("Kontak"),
                      subtitle: Text("Chizumiee@example.com"),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol interaktif
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Terima kasih sudah pakai FocusList! ❤️‍🔥"),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              icon: const Icon(Icons.favorite),
              label: const Text("Support Developer"),
            ),
          ],
        ),
      ),
    );
  }
}
