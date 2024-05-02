import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeView extends StatelessWidget {
  final String videoKey;

  const YoutubeView({super.key, required this.videoKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      width: double.infinity,
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoKey,
        ),
        showVideoProgressIndicator: true,
      ),
    );
  }
}
