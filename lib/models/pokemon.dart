/// Model data Pokemon yang merepresentasikan entitas Pokemon.
/// Memuat seluruh atribut yang dibutuhkan sesuai rubrik kuis:
/// - Nama (name)
/// - Tipe (types)
/// - Kemampuan (ability)
/// - Tinggi (height)
/// - Berat (weight)
/// - Gambar (imageUrl)
class Pokemon {
  final String name;
  final List<String> types;
  final String ability;
  final String height;
  final String weight;
  final String imageUrl;

  const Pokemon({
    required this.name,
    required this.types,
    required this.ability,
    required this.height,
    required this.weight,
    required this.imageUrl,
  });
}

/// Daftar data dummy Pokemon yang akan ditampilkan pada Home Page (ListView.builder)
/// Menggunakan URL gambar resmi (official artwork) berkualitas tinggi dari PokeAPI CDN.
final List<Pokemon> dummyPokemonList = [
  const Pokemon(
    name: 'Bulbasaur',
    types: ['Grass', 'Poison'],
    ability: 'Overgrow',
    height: '0.7 m',
    weight: '6.9 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
  ),
  const Pokemon(
    name: 'Ivysaur',
    types: ['Grass', 'Poison'],
    ability: 'Overgrow',
    height: '1.0 m',
    weight: '13.0 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
  ),
  const Pokemon(
    name: 'Venusaur',
    types: ['Grass', 'Poison'],
    ability: 'Overgrow',
    height: '2.0 m',
    weight: '100.0 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
  ),
  const Pokemon(
    name: 'Charmander',
    types: ['Fire'],
    ability: 'Blaze',
    height: '0.6 m',
    weight: '8.5 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
  ),
  const Pokemon(
    name: 'Charmeleon',
    types: ['Fire'],
    ability: 'Blaze',
    height: '1.1 m',
    weight: '19.0 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
  ),
  const Pokemon(
    name: 'Charizard',
    types: ['Fire', 'Flying'],
    ability: 'Blaze',
    height: '1.7 m',
    weight: '90.5 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
  ),
  const Pokemon(
    name: 'Squirtle',
    types: ['Water'],
    ability: 'Torrent',
    height: '0.5 m',
    weight: '9.0 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
  ),
  const Pokemon(
    name: 'Wartortle',
    types: ['Water'],
    ability: 'Torrent',
    height: '1.0 m',
    weight: '22.5 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png',
  ),
  const Pokemon(
    name: 'Blastoise',
    types: ['Water'],
    ability: 'Torrent',
    height: '1.6 m',
    weight: '85.5 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png',
  ),
  const Pokemon(
    name: 'Pikachu',
    types: ['Electric'],
    ability: 'Static',
    height: '0.4 m',
    weight: '6.0 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
  ),
  const Pokemon(
    name: 'Raichu',
    types: ['Electric'],
    ability: 'Static',
    height: '0.8 m',
    weight: '30.0 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/26.png',
  ),
  const Pokemon(
    name: 'Gengar',
    types: ['Ghost', 'Poison'],
    ability: 'Cursed Body',
    height: '1.5 m',
    weight: '40.5 kg',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png',
  ),
];
