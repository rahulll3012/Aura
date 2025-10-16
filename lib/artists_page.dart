import 'package:flutter/material.dart';
import 'package:aura_music_app/mock_data.dart';

class ArtistsPage extends StatelessWidget {
  const ArtistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final artists = mockAlbums.map((album) => album.artist).toSet().toList();
    final artistImages = {
      "The Weeknd": "https://i.scdn.co/image/ab6761610000e5eb214f3cf1cbe7139c1e26ff02",
      "Harry Styles": "https://i.scdn.co/image/ab6761610000e5eb64046d8d471b3a3956dba983",
      "Dua Lipa": "https://i.scdn.co/image/ab6761610000e5eb7da39dea0b2746c1811c0c7c",
      "Olivia Rodrigo": "https://i.scdn.co/image/ab6761610000e5eb09bfd3993a2b2b1b2f7b3b6f"
    };


    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            title: Text(
              'Your Artists',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final artistName = artists[index];
                final imageUrl = artistImages[artistName] ?? 'https://placehold.co/100x100/2a2a2a/ffffff?text=A';
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imageUrl),
                    onBackgroundImageError: (exception, stackTrace) => {},
                    child: imageUrl.isEmpty ? const Icon(Icons.person) : null,
                  ),
                  title: Text(
                    artistName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Artist',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Follow', style: TextStyle(color: Colors.white)),
                  ),
                );
              },
              childCount: artists.length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 150),
          ),
        ],
      ),
    );
  }
}