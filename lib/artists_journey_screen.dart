import 'package:flutter/material.dart';
import 'package:aura_music_app/artist_journey_data.dart';

import 'models/artist_model.dart';
class ArtistsJourneyScreen extends StatelessWidget {
  const ArtistsJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final artists = mockArtists;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose an Artist's Journey"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: artists.length,
        itemBuilder: (context, index) {
          final artist = artists[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(artist.imageUrl),
            ),
            title: Text(artist.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text("Explore their career timeline", style: const TextStyle(color: Colors.grey)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtistJourneyTimelinePage(artist: artist),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// This page displays the actual timeline for a selected artist.
class ArtistJourneyTimelinePage extends StatelessWidget {
  final Artist artist;
  const ArtistJourneyTimelinePage({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    final journeyEvents = artistJourneys[artist.name] ?? [];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "${artist.name}: A Journey",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      artist.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[800]),
                    ),
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
            if (journeyEvents.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Center(child: Text("No journey data available for this artist.", style: TextStyle(color: Colors.grey))),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final event = journeyEvents[index];
                    return TimelineTile(
                      year: event.year,
                      event: event.event,
                      isFirst: index == 0,
                      isLast: index == journeyEvents.length - 1,
                      eventType: event.type,
                    );
                  },
                  childCount: journeyEvents.length,
                ),
              ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 150), // To avoid overlap
            ),
          ],
        ),
      ),
    );
  }
}

// --- Timeline Tile Widget (unchanged) ---
class TimelineTile extends StatelessWidget {
  final String year;
  final String event;
  final bool isFirst;
  final bool isLast;
  final String eventType;

  const TimelineTile({
    super.key,
    required this.year,
    required this.event,
    this.isFirst = false,
    this.isLast = false,
    required this.eventType,
  });

  IconData _getIconForEventType(String type) {
    switch (type) {
      case 'album':
        return Icons.album;
      case 'award':
        return Icons.star;
      case 'tour':
        return Icons.flight_takeoff;
      case 'milestone':
        return Icons.flag;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 100,
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Text(
              year,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: 2,
                height: isFirst ? 16 : 32, // Adjust space before the dot
                color: isFirst ? Colors.transparent : Colors.grey,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getIconForEventType(eventType),
                  color: Colors.green,
                  size: 20,
                ),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: isLast ? Colors.transparent : Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    event,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}