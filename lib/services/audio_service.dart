import 'package:audioplayers/audioplayers.dart';

import '../models/sound_model.dart';

/// Service responsible for handling audio playback for multiple sounds.
class AudioService {
  final Map<String, AudioPlayer> _players = {};

  Future<void> play(SoundModel sound) async {
    final player = _players.putIfAbsent(sound.name, () {
      final p = AudioPlayer();
      p.setReleaseMode(ReleaseMode.loop);
      return p;
    });

    await player.play(AssetSource(sound.assetPath), volume: sound.volume);
    sound.isPlaying = true;
  }

  Future<void> stop(SoundModel sound) async {
    final player = _players[sound.name];
    if (player != null) {
      await player.stop();
    }
    sound.isPlaying = false;
  }

  Future<void> setVolume(SoundModel sound, double volume) async {
    sound.volume = volume;
    final player = _players[sound.name];
    if (player != null) {
      await player.setVolume(volume);
    }
  }

  /// Dispose all audio players to release resources.
  Future<void> dispose() async {
    for (final player in _players.values) {
      await player.dispose();
    }
    _players.clear();
  }
}

