import 'package:flutter/material.dart';

/// Model representing an ambient sound.
class SoundModel {
  final String name;
  final String assetPath;
  final IconData icon;
  double volume;
  bool isPlaying;

  SoundModel({
    required this.name,
    required this.assetPath,
    required this.icon,
    this.volume = 0.5,
    this.isPlaying = false,
  });
}

