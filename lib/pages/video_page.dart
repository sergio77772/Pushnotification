import 'dart:math';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _controller;

final List<String> _videoIds = [
  'aKq8bkY5eTU',
  'zajUgQLviwk', 
  'zxYjTTXc-J8', 
  'CsHWxgdo11g', 
  'pF0RP5XIOOM', 
];

  @override
  void initState() {
    super.initState();
    _seleccionarVideoAleatorio();
  }

  void _seleccionarVideoAleatorio() {
    final indiceAleatorio = Random().nextInt(_videoIds.length);
    final videoAleatorio = _videoIds[indiceAleatorio]; // obtiene el video aleatorio

    _controller = YoutubePlayerController(
      initialVideoId: videoAleatorio,
      flags: const YoutubePlayerFlags(
        autoPlay: true, 
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Video (aleatorio)",style: TextStyle(fontSize: 18),)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: const Offset(2, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
