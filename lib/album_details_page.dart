import 'package:flutter/material.dart';
import 'package:aura_music_app/mock_data.dart';
import 'package:aura_music_app/now_playing_screen.dart';


class AlbumDetailsPage extends StatelessWidget {
  final Album album;

  const AlbumDetailsPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    // In a real app, you'd fetch songs specific to this album.
    // For this example, we'll just show the general list of mock songs.
    final songs = mockSongs;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                album.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    album.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: Colors.grey[800]),
                  ),
                  // Add a gradient for better title visibility
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    album.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(album.imageUrl),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        album.artist,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final song = songs[index];
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  title: Text(song.title, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(song.artist, style: const TextStyle(color: Colors.grey)),
                  trailing: const Icon(Icons.more_vert, color: Colors.grey),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NowPlayingScreen(song: song),
                      ),
                    );
                  },
                );
              },
              childCount: songs.length,
            ),
          ),
        ],
      ),
    );
  }
}