import 'package:flutter/material.dart';
import 'screens/login_page.dart';

/// Entry point utama aplikasi Flutter.
/// Fungsi main() akan mengeksekusi aplikasi pertama kali saat dijalankan.
void main() {
  runApp(const PokemonApp());
}

/// Root Widget aplikasi yang mengatur konfigurasi global seperti Tema dan Rute Awal.
class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi
      title: 'Pokemon App',
      // Menghilangkan banner debug di pojok kanan atas layar
      debugShowCheckedModeBanner: false,
      
      // Konfigurasi Tema Aplikasi (Warna oranye/kuning bertema Pokemon)
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          primary: Colors.deepOrange,
          secondary: Colors.amber,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.grey.shade50,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      
      // Halaman pertama yang ditampilkan saat aplikasi dibuka adalah LoginPage
      home: const LoginPage(),
    );
  }
}
