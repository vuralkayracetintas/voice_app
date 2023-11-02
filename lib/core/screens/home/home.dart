import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:voice_app/bloc/ArtistBloc/artist_bloc.dart';
import 'package:voice_app/core/demo.dart';
import 'package:voice_app/product/model/artist_model.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedVoice = '21m00Tcm4TlvDq8ikWAM';
  TextEditingController _textFieldController = TextEditingController();
  bool _isLoadingVoice = false;
  final player = AudioPlayer();

  @override
  void dispose() {
    _textFieldController.dispose();
    player.dispose();
    super.dispose();
  }

  Future<void> playTextToSpeech(String text, String selectedVoice) async {
    setState(() {
      _isLoadingVoice = true;
    });

    String url = 'https://api.elevenlabs.io/v1/text-to-speech/$selectedVoice';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'accept': 'audio/mpeg',
        'xi-api-key': '4caf266526d96c6c604e9dfe153ee4d9',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "text": text,
        "model_id": "eleven_monolingual_v1",
        "voice_settings": {
          "stability": .15,
          "similarity_boost": .75,
        }
      }),
    );

    setState(() {
      _isLoadingVoice = false;
    });

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      await player.setAudioSource(MyCustomSource(bytes));
      player.play();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ArtistBloc(
        RepositoryProvider.of(context),
      )..add(LoadArtist()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text to Speech Conversion'),
        ),
        body: BlocBuilder<ArtistBloc, ArtistState>(
          builder: (context, state) {
            debugPrint('state ${state.runtimeType}');
            if (state is ArtistInitial || state is ArtistLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ArtistError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is ArtistLoaded) {
              // API'den gelen ses kimliklerini içerir
              List<Voices> voiseList = state.artistModel.voices!;
              List<String?> voiceIds =
                  voiseList.map((voice) => voice.voiceId).toList();
              List<String?> voiseArtistName =
                  voiseList.map((voise) => voise.name).toList();

              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<ArtistBloc>(context).add(LoadArtist());
                  },
                  child: Column(
                    children: [
                      TextField(
                        controller: _textFieldController,
                        decoration: const InputDecoration(
                          labelText: 'Enter some text',
                        ),
                      ),
                      DropdownButton<String>(
                        value: selectedVoice,
                        onChanged: (newValue) {
                          setState(() {
                            selectedVoice = newValue!;
                          });
                        },
                        items: voiseList.map((voice) {
                          return DropdownMenuItem(
                            value: voice.voiceId,
                            child: Text(
                                "${voice.name} , ${voice.labels?.accent}"), // 'name' özelliğini kullanın
                          );
                        }).toList(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          playTextToSpeech(
                              _textFieldController.text, selectedVoice);
                        },
                        child: _isLoadingVoice
                            ? const LinearProgressIndicator()
                            : const Icon(Icons.volume_up),
                      )
                    ],
                  ));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}




/*
ListView.builder(
                  itemCount: voiseList.length,
                  itemBuilder: (context, index) {
                    Voices voice = voiseList[index];
                    return ListTile(
                      title: Text(
                          'Ses ${voice.voiceId}'), // voiceId'yi metin olarak göster
                      // Diğer bilgileri eklemek için ListTile'ı özelleştirebilirsiniz
                    );
                  },
                )
*/