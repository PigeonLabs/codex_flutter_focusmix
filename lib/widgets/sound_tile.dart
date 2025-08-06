import 'package:flutter/material.dart';

import '../models/sound_model.dart';
import '../services/audio_service.dart';

/// Widget representing a single sound control tile.
class SoundTile extends StatefulWidget {
  final SoundModel sound;
  final AudioService audioService;

  const SoundTile({super.key, required this.sound, required this.audioService});

  @override
  State<SoundTile> createState() => _SoundTileState();
}

class _SoundTileState extends State<SoundTile> {
  @override
  Widget build(BuildContext context) {
    final sound = widget.sound;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(sound.icon),
                const SizedBox(width: 8),
                Expanded(child: Text(sound.name)),
                Switch(
                  value: sound.isPlaying,
                  onChanged: (value) async {
                    if (value) {
                      await widget.audioService.play(sound);
                    } else {
                      await widget.audioService.stop(sound);
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
            Slider(
              min: 0,
              max: 1,
              value: sound.volume,
              onChanged: (value) async {
                await widget.audioService.setVolume(sound, value);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

