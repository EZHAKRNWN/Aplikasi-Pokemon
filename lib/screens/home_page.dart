import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import 'detail_page.dart';

/// Halaman Home / Daftar Pokemon (HomePage)
/// Fitur utama:
/// 1. Menampilkan daftar Pokemon menggunakan ListView.builder.
/// 2. Setiap item menampilkan Gambar (Network Image), Nama, dan Tipe Pokemon (Badge berwarna).
/// 3. Setiap item dapat diklik (clickable via InkWell) untuk berpindah ke DetailPage
///    dengan membawa objek Pokemon yang dipilih.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Fungsi helper untuk memberikan warna yang sesuai berdasarkan tipe Pokemon
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // AppBar dengan ikon dan judul Daftar Pokemon
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.catching_pokemon, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Daftar Pokemon',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 0,
      ),
      // ListView.builder untuk merender list secara dinamis dan efisien memori
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: dummyPokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = dummyPokemonList[index];
          final primaryType =
              pokemon.types.isNotEmpty ? pokemon.types.first : 'Normal';
          final primaryColor = _getTypeColor(primaryType);

          // Card untuk membungkus setiap item Pokemon
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            // InkWell memberikan efek ripple saat item ditekan
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                // Navigasi ke Halaman Detail (DetailPage) dengan mengirimkan objek Pokemon yang diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(pokemon: pokemon),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Gambar Pokemon dari URL Internet
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: primaryColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Hero(
                          tag: 'pokemon-${pokemon.name}',
                          child: Image.network(
                            pokemon.imageUrl,
                            fit: BoxFit.contain,
                            // Fallback jika gambar gagal dimuat
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.catching_pokemon,
                              size: 40,
                              color: Colors.deepOrange,
                            ),
                            // Indikator loading saat gambar sedang diunduh
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Kolom Nama & Tipe Pokemon
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Menampilkan Nama Pokemon
                          Text(
                            pokemon.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          
                          // Menampilkan Badge Tipe Pokemon
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: pokemon.types.map((type) {
                              final typeColor = _getTypeColor(type);
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: typeColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  type,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    // Ikon panah penunjuk detail
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
