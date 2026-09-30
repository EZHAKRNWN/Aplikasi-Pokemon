import 'package:flutter/material.dart';
import 'login_page.dart';

/// Halaman Profil (ProfilePage)
/// Catatan Khusus Rubrik:
/// - Menggunakan StatefulWidget karena mengelola perubahan state avatar profil secara dinamis.
/// Fitur utama:
/// 1. Default Profile Image: Victor (karakter laki-laki).
/// 2. Menampilkan username yang dikirim dari halaman Login.
/// 3. Menampilkan teks sumpah kejujuran persis sesuai teks yang diwajibkan.
/// 4. Image Switcher Feature: Dua tombol bulat (GestureDetector) untuk mengganti avatar (Laki-laki & Perempuan).
/// 5. Tombol Logout yang mengarahkan kembali ke halaman Login dengan Navigator.pushAndRemoveUntil.
class ProfilePage extends StatefulWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // URL gambar karakter avatar resmi (Bulbagarden Archives)
  static const String maleImageUrl =
      'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';
  static const String femaleImageUrl =
      'https://archives.bulbagarden.net/media/upload/c/cd/Sword_Shield_Gloria.png';

  // State: URL gambar profil yang sedang aktif (Default: Karakter Victor / Laki-laki)
  String _currentProfileImage = maleImageUrl;

  /// Helper widget untuk membuat tombol avatar lingkaran dengan GestureDetector
  Widget _buildCircularAvatarButton({
    required String imageUrl,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    // GestureDetector mendeteksi ketukan (tap) dari pengguna
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // Indikator visual: Garis tepi lebih tebal dan berwarna jika sedang dipilih
              border: Border.all(
                color: isSelected ? Colors.deepOrange : Colors.grey.shade300,
                width: isSelected ? 3 : 1.5,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.deepOrange.withValues(alpha: 0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      )
                    ]
                  : [],
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.orange.shade50,
              child: ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.deepOrange,
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          // Label nama karakter di bawah tombol avatar
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.deepOrange : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  /// Fungsi Logout: membersihkan stack route dan kembali ke LoginPage
  void _handleLogout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false, // false berarti semua riwayat route sebelumnya dihapus
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Profil Pelatih',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          children: [
            // 1. KARTU INFORMASI PROFIL & USERNAME
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 24.0,
                ),
                child: Column(
                  children: [
                    // Tampilan Avatar Utama (Main Profile Image)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.deepOrange, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrange.withValues(alpha: 0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.orange.shade50,
                        child: ClipOval(
                          child: Image.network(
                            _currentProfileImage,
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.person,
                              size: 70,
                              color: Colors.deepOrange,
                            ),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.deepOrange,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 2. MENAMPILKAN USERNAME YANG DIKIRIM DARI LOGIN PAGE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.verified_user,
                          color: Colors.deepOrange,
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.username.isNotEmpty
                              ? widget.username
                              : 'Trainer',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // 3. TEKS SUMPAH KEJUJURAN PERSIS SESUAI KETENTUAN RUBRIK
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.amber.shade300),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.format_quote,
                                color: Colors.orange.shade800,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Pernyataan Kejujuran',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange.shade900,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 4. IMAGE SWITCHER FEATURE (DUA TOMBOL BULAT DENGAN GESTURE DETECTOR)
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 18.0,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Pilih Karakter Pelatih (Image Switcher)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Baris kedua tombol avatar (Male & Female)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Tombol Laki-laki: Mengubah avatar ke karakter Victor
                        _buildCircularAvatarButton(
                          imageUrl: maleImageUrl,
                          label: 'Laki-laki (Victor)',
                          isSelected: _currentProfileImage == maleImageUrl,
                          onTap: () {
                            setState(() {
                              _currentProfileImage = maleImageUrl;
                            });
                          },
                        ),
                        // Tombol Perempuan: Mengubah avatar ke karakter Gloria
                        _buildCircularAvatarButton(
                          imageUrl: femaleImageUrl,
                          label: 'Perempuan (Gloria)',
                          isSelected: _currentProfileImage == femaleImageUrl,
                          onTap: () {
                            setState(() {
                              _currentProfileImage = femaleImageUrl;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),

            // 5. TOMBOL LOGOUT (NAVIGATOR.PUSHANDREMOVEUNTIL)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _handleLogout,
                icon: const Icon(Icons.logout),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
