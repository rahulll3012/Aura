import 'package:flutter/material.dart';
import 'package:aura_music_app/search_page.dart';
import 'package:aura_music_app/artists_page.dart';
import 'package:aura_music_app/artists_journey_screen.dart';
import 'package:aura_music_app/now_playing_screen.dart';
import 'package:aura_music_app/mock_data.dart';
import 'package:aura_music_app/account_page.dart';
import 'package:aura_music_app/album_details_page.dart';
import 'package:aura_music_app/playlist_details_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SearchPage(),
    const ArtistsPage(),
    const ArtistsJourneyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Mini Player
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NowPlayingScreen(song: mockSongs[0]),
                ),
              );
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[900],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      mockSongs[0].imageUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.music_note),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mockSongs[0].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          mockSongs[0].artist,
                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.play_arrow, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          // Bottom Navigation Bar
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Artists',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Journey',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          title: const Text(
            'Good evening',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountPage()),
                );
              },
            ),
          ],
        ),

        const _SectionHeader(title: 'Recently Played'),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200, // Increased height for artist name
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockAlbums.length,
              itemBuilder: (context, index) {
                final album = mockAlbums[index];
                return _AlbumCard(album: album);
              },
            ),
          ),
        ),

        const _SectionHeader(title: 'Made For You'),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockPlaylists.length,
              itemBuilder: (context, index) {
                final playlist = mockPlaylists[index];
                return _PlaylistCard(playlist: playlist);
              },
            ),
          ),
        ),

        const _SectionHeader(title: 'New Releases'),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200, // Increased height for artist name
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockAlbums.reversed.toList().length,
              itemBuilder: (context, index) {
                final album = mockAlbums.reversed.toList()[index];
                return _AlbumCard(album: album);
              },
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 80),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _AlbumCard extends StatelessWidget {
  final Album album;
  const _AlbumCard({required this.album});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumDetailsPage(album: album),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                album.imageUrl,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(width: 140, height: 140, color: Colors.grey[800]),
              ),
              const SizedBox(height: 8),
              Text(
                album.title,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                album.artist,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  const _PlaylistCard({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistDetailsPage(playlist: playlist),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                playlist.imageUrl,
                width: 160,
                height: 160,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(width: 160, height: 160, color: Colors.grey[800]),
              ),
              const SizedBox(height: 8),
              Text(
                playlist.title,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
