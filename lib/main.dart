import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'providers/todo_provider.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/splash_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FocusList',
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(), // semua text default Nunito
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/splash', // 👈 mulai dari splash
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/': (context) => const HomeScreen(),
          '/about': (context) => const AboutScreen(),
        },
      ),
    );
  }
}
