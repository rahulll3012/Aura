import 'dart:async';
import 'package:flutter/material.dart';
import 'package:aura_music_app/mock_data.dart';

class NowPlayingScreen extends StatefulWidget {
  final Song song;
  const NowPlayingScreen({super.key, required this.song});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  double _currentSliderValue = 0;
  Timer? _timer;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentSliderValue < widget.song.duration.inSeconds) {
        setState(() {
          _currentSliderValue++;
        });
      } else {
        timer.cancel();
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Now Playing',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Album Art
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                widget.song.imageUrl,
                height: MediaQuery.of(context).size.width - 48,
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: MediaQuery.of(context).size.width - 48,
                  width: MediaQuery.of(context).size.width - 48,
                  color: Colors.grey[800],
                  child: const Icon(Icons.music_note, color: Colors.white, size: 100),
                ),
              ),
            ),

            // Song Info
            Column(
              children: [
                Text(
                  widget.song.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.song.artist,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            // Timeline Slider
            Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4.0,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey[700],
                    thumbColor: Colors.white,
                    overlayColor: Colors.white.withAlpha(32),
                  ),
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: widget.song.duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(Duration(seconds: _currentSliderValue.toInt())),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        _formatDuration(widget.song.duration),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.shuffle, color: Colors.grey, size: 28),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.skip_previous, color: Colors.white, size: 40),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                    color: Colors.white,
                    size: 70,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                      if (_isPlaying) {
                        _startTimer();
                      } else {
                        _timer?.cancel();
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next, color: Colors.white, size: 40),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.repeat, color: Colors.grey, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
