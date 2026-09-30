import 'package:flutter/material.dart';
import '../models/pokemon.dart';

/// Halaman Detail Pokemon (DetailPage)
/// Fitur utama:
/// 1. Menerima objek Pokemon yang dikirimkan dari HomePage.
/// 2. Menampilkan gambar Pokemon secara besar dan menonjol (Prominently).
/// 3. Menampilkan SEMUA properti: Nama, Tipe, Kemampuan (Ability), Tinggi (Height), dan Berat (Weight).
/// 4. Menyediakan tombol "Kembali" yang mencolok di bagian bawah untuk kembali ke halaman sebelumnya.
class DetailPage extends StatelessWidget {
  // Objek Pokemon yang diterima dari halaman pemanggil
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});

  /// Helper untuk warna tipe Pokemon
  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Colors.green;
      case 'poison':
        return Colors.purple;
      case 'fire':
        return Colors.deepOrange;
      case 'flying':
        return Colors.indigo;
      case 'water':
        return Colors.blue;
      case 'electric':
        return Colors.amber.shade700;
      case 'ghost':
        return Colors.deepPurple;
      case 'normal':
        return Colors.brown.shade400;
      default:
        return Colors.teal;
    }
  }

  /// Helper widget untuk membuat baris informasi karakteristik Pokemon
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Ikon atribut dengan background lembut
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (iconColor ?? Colors.orange).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor ?? Colors.orange, size: 22),
          ),
          const SizedBox(width: 16),
          // Label dan Nilai atribut
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryType =
        pokemon.types.isNotEmpty ? pokemon.types.first : 'Normal';
    final primaryColor = _getTypeColor(primaryType);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          pokemon.name,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. TAMPILAN GAMBAR POKEMON SECARA PROMINENT / BESAR
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor.withValues(alpha: 0.2),
                    Colors.orange.shade100,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Hero(
                  tag: 'pokemon-${pokemon.name}',
                  child: Image.network(
                    pokemon.imageUrl,
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.catching_pokemon,
                      size: 100,
                      color: Colors.deepOrange,
                    ),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.deepOrange),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 2. NAMA POKEMON
            Center(
              child: Text(
                pokemon.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 3. TIPE POKEMON (BADGE CHIPS)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.types.map((type) {
                final typeColor = _getTypeColor(type);
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: typeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // 4. SELURUH PROPERTI DARI DATA DUMMY
            const Text(
              'Informasi Karakteristik',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Nama Pokemon
            _buildInfoRow(
              icon: Icons.badge,
              label: 'Nama Pokemon',
              value: pokemon.name,
              iconColor: Colors.deepOrange,
            ),
            // Tipe Pokemon
            _buildInfoRow(
              icon: Icons.category,
              label: 'Tipe',
              value: pokemon.types.join(', '),
              iconColor: primaryColor,
            ),
            // Kemampuan (Ability)
            _buildInfoRow(
              icon: Icons.auto_awesome,
              label: 'Kemampuan (Ability)',
              value: pokemon.ability,
              iconColor: Colors.purple,
            ),
            // Tinggi (Height)
            _buildInfoRow(
              icon: Icons.height,
              label: 'Tinggi (Height)',
              value: pokemon.height,
              iconColor: Colors.blue,
            ),
            // Berat (Weight)
            _buildInfoRow(
              icon: Icons.fitness_center,
              label: 'Berat (Weight)',
              value: pokemon.weight,
              iconColor: Colors.green,
            ),

            const SizedBox(height: 24),

            // 5. TOMBOL "KEMBALI" YANG PROMINEN
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                // Navigator.pop(context) untuk menutup halaman ini dan kembali ke halaman sebelumnya
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  'Kembali',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
