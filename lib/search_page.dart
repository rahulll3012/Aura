import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'Podcasts', 'color': Colors.red, 'image': 'https://i.scdn.co/image/ab6765630000ba8a072e15e72d95d259c4155552'},
      {'title': 'Live Events', 'color': Colors.purple, 'image': 'https://i.scdn.co/image/ab67706f00000002b5c015153215c94e9d5645f6'},
      {'title': 'Made For You', 'color': Colors.blue, 'image': 'https://i.scdn.co/image/ab67706f00000002c3928d3e339b8525a8e022b9'},
      {'title': 'New Releases', 'color': Colors.orange, 'image': 'https://i.scdn.co/image/ab67706f0000000213a53293e5oco5e5a5e5e5e5'}, // Placeholder
      {'title': 'Pop', 'color': Colors.pink, 'image': 'https://i.scdn.co/image/ab67706f000000029bbd79106e510d13a9a583b4'},
      {'title': 'Hip-Hop', 'color': Colors.amber, 'image': 'https://i.scdn.co/image/ab67706f00000003c582520934526d11f2b8969f'},
      {'title': 'Rock', 'color': Colors.grey, 'image': 'https://i.scdn.co/image/ab67706f00000002fe6d8d1019d5230a1c4c403a'},
      {'title': 'Indie', 'color': Colors.brown, 'image': 'https://i.scdn.co/image/ab67706f00000002aa9393e8a0159423d24255d0'},
      {'title': 'Charts', 'color': Colors.indigo, 'image': 'https://i.scdn.co/image/ab67706f00000003b839d34e622b84a32710167c'},
      {'title': 'Discover', 'color': Colors.teal, 'image': 'https://i.scdn.co/image/ab67706f00000003e3334b3c107a16ded2977335'},
    ];

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            title: const Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'What do you want to listen to?',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Browse all',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 16 / 9,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final category = categories[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Stack(
                      children: [
                        Container(color: category['color']),
                        Positioned(
                          bottom: -10,
                          right: -20,
                          child: Transform.rotate(
                            angle: 0.4,
                            child: Image.network(
                              category['image'],
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.music_note, size: 80),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Text(
                            category['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: categories.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 150), // To avoid overlap
          ),
        ],
      ),
    );
  }
}