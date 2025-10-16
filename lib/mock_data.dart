// Data Models
class Song {
  final String title;
  final String artist;
  final String imageUrl;
  final Duration duration;

  Song({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.duration,
  });
}

class Album {
  final String title;
  final String artist;
  final String imageUrl;

  Album({
    required this.title,
    required this.artist,
    required this.imageUrl,
  });
}

class Playlist {
  final String title;
  final String description;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

// Mock Data
final List<Song> mockSongs = [
  Song(
    title: "Blinding Lights",
    artist: "The Weeknd",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36",
    duration: const Duration(minutes: 3, seconds: 20),
  ),
  Song(
    title: "As It Was",
    artist: "Harry Styles",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b273b46f74097655d7f353caab14",
    duration: const Duration(minutes: 2, seconds: 47),
  ),
  Song(
    title: "Levitating",
    artist: "Dua Lipa",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b273bd252331899f3a2dd2a0e413",
    duration: const Duration(minutes: 3, seconds: 23),
  ),
  Song(
    title: "good 4 u",
    artist: "Olivia Rodrigo",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b273a10221354a619d2269a0a417",
    duration: const Duration(minutes: 2, seconds: 58),
  ),
  Song(
    title: "Stay",
    artist: "The Kid LAROI, Justin Bieber",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b27341e31d6ea1d46336093dfc23",
    duration: const Duration(minutes: 2, seconds: 21),
  ),
];

final List<Album> mockAlbums = [
  Album(
    title: "After Hours",
    artist: "The Weeknd",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36",
  ),
  Album(
    title: "Harry's House",
    artist: "Harry Styles",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b273b46f74097655d7f353caab14",
  ),
  Album(
    title: "Future Nostalgia",
    artist: "Dua Lipa",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b273bd252331899f3a2dd2a0e413",
  ),
  Album(
    title: "SOUR",
    artist: "Olivia Rodrigo",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b273a10221354a619d2269a0a417",
  ),
  Album(
    title: "Justice",
    artist: "Justin Bieber",
    imageUrl: "https://i.scdn.co/image/ab67616d0000b273e6f407c7f3a0ec98845e4431",
  ),
];

final List<Playlist> mockPlaylists = [
  Playlist(
    title: "Today's Top Hits",
    description: "The biggest songs of the moment.",
    imageUrl: "https://i.scdn.co/image/ab67706f00000003b839d34e622b84a32710167c",
  ),
  Playlist(
    title: "RapCaviar",
    description: "The most influential hip-hop playlist.",
    imageUrl: "https://i.scdn.co/image/ab67706f00000003c582520934526d11f2b8969f",
  ),
  Playlist(
    title: "Viva Latino",
    description: "The best of Latin music.",
    imageUrl: "https://i.scdn.co/image/ab67706f00000003e3334b3c107a16ded2977335",
  ),
  Playlist(
    title: "Chill Hits",
    description: "Kick back to the best new and recent chill hits.",
    imageUrl: "https://i.scdn.co/image/ab67706f00000003c3928d3e339b8525a8e022b9",
  ),
  Playlist(
    title: "Rock Classics",
    description: "Rock legends and epic songs that continue to inspire generations.",
    imageUrl: "https://i.scdn.co/image/ab67706f00000003fe6d8d1019d5230a1c4c403a",
  ),
];