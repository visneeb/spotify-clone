import 'package:flutter/material.dart';
import '../../../data/models/track_model.dart';
import '../../../shared/widgets/music_card.dart';
import '../../../shared/widgets/mini_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Track> tracks = const [
    Track(
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      album: 'After Hours',
      imageUrl: 'https://picsum.photos/seed/album1/48/48',
      duration: '3.20',
      durationSeconds: 200,
    ),
    Track(
      title: 'Starboy',
      artist: 'The Weeknd',
      album: 'Starboy',
      imageUrl: 'https://picsum.photos/seed/album2/48/48',
      duration: '3.50',
      durationSeconds: 230,
    ),
    Track(
      title: 'Save Your Tears',
      artist: 'The Weeknd',
      album: 'After Hours',
      imageUrl: 'https://picsum.photos/seed/album3/48/48',
      duration: '3.35',
      durationSeconds: 215,
    ),
    Track(
      title: 'Die For You',
      artist: 'The Weeknd',
      album: 'Starboy',
      imageUrl: 'https://picsum.photos/seed/album4/48/48',
      duration: '4.20',
      durationSeconds: 260,
    ),
  ];

  late Track currentTrack;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    currentTrack = tracks.first;
  }

  void _selectTrack(Track track) {
    setState(() {
      currentTrack = track;
      isPlaying = true;
    });
  }

  void _togglePlay() => setState(() => isPlaying = !isPlaying);

  void _nextTrack() {
    final next = (tracks.indexOf(currentTrack) + 1) % tracks.length;
    setState(() {
      currentTrack = tracks[next];
    });
  }

  void _previousTrack() {
    final index = tracks.indexOf(currentTrack);
    final previous = (index - 1 + tracks.length) % tracks.length;
    setState(() => currentTrack = tracks[previous]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spotify Clone')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: tracks.length,
        itemBuilder: (context, index) {
          final track = tracks[index];
          return MusicCard(
            title: track.title,
            artist: track.artist,
            album: track.album,
            imageUrl: track.imageUrl,
            duration: track.duration,
            durationSeconds: track.durationSeconds,
            isPlaying: currentTrack == track && isPlaying,
            onTap: () => _selectTrack(track),
          );
        },
      ),
      bottomNavigationBar: MiniPlayer(
        title: currentTrack.title,
        artist: currentTrack.artist,
        imageUrl: currentTrack.imageUrl,
        isPlaying: isPlaying,
        durationSeconds: currentTrack.durationSeconds,
        progress: 0.35,
        onPlayPause: _togglePlay,
        onNext: _nextTrack,
        onPrevious: _previousTrack,
        onTap: () {},
      ),
    );
  }
}
