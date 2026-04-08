import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class MiniPlayer extends StatelessWidget {
  final String title;
  final String artist;
  final String imageUrl;
  final bool isPlaying;
  final double progress;
  final int durationSeconds;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onTap;

  const MiniPlayer({
    super.key,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.isPlaying,
    required this.progress,
    required this.durationSeconds,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 0, 0, 0),

      child: _PlayerContent(
        title: title,
        artist: artist,
        imageUrl: imageUrl,
        isPlaying: isPlaying,
        progress: progress,
        durationSeconds: durationSeconds,
        onPlayPause: onPlayPause,
        onNext: onNext,
        onPrevious: onPrevious,
      ),
    );
  }
}

class _PlayerContent extends StatelessWidget {
  final String title;
  final String artist;
  final String imageUrl;
  final bool isPlaying;
  final double progress;
  final int durationSeconds;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const _PlayerContent({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.isPlaying,
    required this.progress,
    required this.durationSeconds,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 600;

        return SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: isNarrow
                ? _buildNarrowLayout(context)
                : _buildWideLayout(context, constraints),
          ),
        );
      },
    );
  }

  // Mobile layout
  Widget _buildNarrowLayout(BuildContext context) {
    final safeProgress = progress.clamp(0.0, 1.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            _AlbumArt(imageUrl: imageUrl),
            const SizedBox(width: 12),
            Expanded(
              child: _TrackInfo(title: title, artist: artist),
            ),
            _ControlButton(
              icon: Icons.skip_previous,
              onPressed: onPrevious,
              size: 22,
            ),
            const SizedBox(width: 4),
            _PlayButton(
              isPlaying: isPlaying,
              onPlayPause: onPlayPause,
              size: 28,
            ),
            const SizedBox(width: 4),
            _ControlButton(icon: Icons.skip_next, onPressed: onNext, size: 25),
          ],
        ),

        Slider(value: safeProgress, onChanged: (value) {}),
      ],
    );
  }

  // Desktop layout
  Widget _buildWideLayout(BuildContext context, BoxConstraints constraints) {
    final safeProgress = progress.clamp(0.0, 1.0);
    final currentSeconds = (safeProgress * durationSeconds).round();

    return Row(
      children: [
        //Album + Info
        SizedBox(
          width: constraints.maxWidth * 0.25,
          child: Row(
            children: [
              _AlbumArt(imageUrl: imageUrl),
              const SizedBox(width: 20),
              Expanded(
                child: _TrackInfo(title: title, artist: artist),
              ),
            ],
          ),
        ),

        //Controls + Progress
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ControlButton(
                    icon: Icons.skip_previous,
                    onPressed: onPrevious,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  _PlayButton(
                    isPlaying: isPlaying,
                    onPlayPause: onPlayPause,
                    size: 34,
                  ),
                  const SizedBox(width: 12),
                  _ControlButton(
                    icon: Icons.skip_next,
                    onPressed: onNext,
                    size: 24,
                  ),
                ],
              ),

              const SizedBox(height: 6),

              //Progress
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _formatTime(currentSeconds),
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),

                  SizedBox(
                    width: constraints.maxWidth * 0.35,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 4,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 10,
                        ),
                        activeTrackColor: AppTheme.textPrimary,
                        inactiveTrackColor: AppTheme.textSecondary.withOpacity(
                          0.3,
                        ),
                        thumbColor: AppTheme.textPrimary,
                        overlayColor: AppTheme.textPrimary.withOpacity(0.2),
                      ),
                      child: Slider(value: safeProgress, onChanged: (value) {}),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    _formatTime(durationSeconds),
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(width: constraints.maxWidth * 0.25),
      ],
    );
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }
}

// COMPONENTS

class _AlbumArt extends StatelessWidget {
  final String imageUrl;

  const _AlbumArt({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
        imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 60,
          height: 60,
          color: AppTheme.surfaceVariant,
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

  const _TrackInfo({required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppTheme.textPrimary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          artist,
          style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final double size;

  const _PlayButton({
    required this.isPlaying,
    required this.onPlayPause,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPlayPause,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppTheme.textPrimary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.black,
          size: size * 0.75,
        ),
      ),
    );
  }
}

class _ControlButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  const _ControlButton({
    required this.icon,
    required this.onPressed,
    this.size = 28,
  });

  @override
  State<_ControlButton> createState() => _ControlButtonState();
}

class _ControlButtonState extends State<_ControlButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: IconButton(
        onPressed: widget.onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        icon: Icon(
          widget.icon,
          size: widget.size,
          color: _hovered ? AppTheme.textPrimary : AppTheme.textSecondary,
        ),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      ),
    );
  }
}
