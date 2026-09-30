import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/profile_page.dart';

/// Widget Pembungkus Navigasi Utama (MainNavigation)
/// Mengimplementasikan BottomNavigationBar untuk beralih antara:
/// 1. Home (Daftar Pokemon)
/// 2. Profile (Profil Trainer)
class MainNavigation extends StatefulWidget {
  // Username yang diterima dari Login Page untuk diteruskan ke ProfilePage
  final String username;

  const MainNavigation({super.key, required this.username});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Index tab yang sedang aktif (0: Home, 1: Profile)
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan pada BottomNavigationBar
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    // Inisialisasi daftar halaman:
    // Tab 0: HomePage (Daftar Pokemon)
    // Tab 1: ProfilePage (Meneruskan username dari widget.username)
    _screens = [
      const HomePage(),
      ProfilePage(username: widget.username),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack digunakan agar state setiap tab (seperti pilihan avatar profil)
      // tetap tersimpan dan tidak ter-reset saat berpindah tab.
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      // Komponen BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Mengubah index halaman yang aktif saat tab ditekan
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          // Item Tab 1: Home
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon),
            label: 'Home',
          ),
          // Item Tab 2: Profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
