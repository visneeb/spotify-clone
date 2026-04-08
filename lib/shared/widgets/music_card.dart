import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class MusicCard extends StatefulWidget {
  final String title;
  final String artist;
  final String album;
  final String imageUrl;
  final String duration;
  final int durationSeconds;
  final bool isPlaying;
  final bool isLiked;
  final VoidCallback onTap;
  final VoidCallback? onLike;
  final VoidCallback? onMore;

  const MusicCard({
    super.key,
    required this.title,
    required this.artist,
    required this.album,
    required this.imageUrl,
    required this.duration,
    required this.durationSeconds,
    required this.onTap,
    this.isPlaying = false,
    this.isLiked = false,
    this.onLike,
    this.onMore,
  });

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  bool _pressed = false;

  Color get _bgColor {
    if (_pressed) return AppTheme.textSecondary.withOpacity(0.2);
    if (widget.isPlaying) return AppTheme.textSecondary.withOpacity(0.2);
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(color: _bgColor),
        child: Row(
          children: [
            _AlbumArt(imageUrl: widget.imageUrl),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: _TrackInfo(
                title: widget.title,
                artist: widget.artist,
                isPlaying: widget.isPlaying,
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.album,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Text(
              widget.duration,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlbumArt extends StatelessWidget {
  final String imageUrl;
  const _AlbumArt({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
        imageUrl,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 48,
          height: 48,
          color: AppTheme.surface,
          child: const Icon(
            Icons.music_note,
            size: 20,
            color: AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  final String title;
  final String artist;
  final bool isPlaying;

  const _TrackInfo({
    required this.title,
    required this.artist,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.textPrimary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 3),
        Text(
          artist,
          style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
