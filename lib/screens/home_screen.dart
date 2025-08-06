import 'package:flutter/material.dart';

import '../models/sound_model.dart';
import '../services/audio_service.dart';
import '../widgets/sound_tile.dart';

/// Home screen displaying all available sounds.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AudioService _audioService;

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
  void initState() {
    super.initState();
    _audioService = AudioService();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

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

