import 'package:flutter/material.dart';

import '../models/sound_model.dart';
import '../services/audio_service.dart';
import '../widgets/sound_tile.dart';

/// Home screen displaying all available sounds.
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AudioService _audioService = AudioService();

  final List<SoundModel> sounds = [
    SoundModel(
      name: 'Rain',
      assetPath: 'sounds/rain.wav',
      icon: Icons.cloud,
    ),
    SoundModel(
      name: 'Wind',
      assetPath: 'sounds/wind.wav',
      icon: Icons.air,
    ),
    SoundModel(
      name: 'Fire',
      assetPath: 'sounds/fire.wav',
      icon: Icons.local_fire_department,
    ),
    SoundModel(
      name: 'Forest',
      assetPath: 'sounds/forest.wav',
      icon: Icons.park,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FocusMix')),
      body: ListView.builder(
        itemCount: sounds.length,
        itemBuilder: (context, index) {
          return SoundTile(
            sound: sounds[index],
            audioService: _audioService,
          );
        },
      ),
    );
  }
}

