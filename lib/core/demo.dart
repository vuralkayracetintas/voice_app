
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';



class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  TextEditingController _textFieldController = TextEditingController();
  final player = AudioPlayer();
  bool _isLoadingVoice = false;
  String selectedVoice = '21m00Tcm4TlvDq8ikWAM';

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
        "voice_settings": {"stability": .15, "similarity_boost": .75}
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('EL TTS Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                labelText: 'Enter some text',
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedVoice,
              onChanged: (newValue) {
                setState(() {
                  selectedVoice = newValue!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: '21m00Tcm4TlvDq8ikWAM',
                  child: Text('Ses 1'),
                ),
                DropdownMenuItem(
                  value: 'AZnzlk1XvdvUeBnXmlld',
                  child: Text('Ses 2'),
                ),
                DropdownMenuItem(
                  value: '2EiwWnXFnvU5JabPnv8n',
                  child: Text('Ses 3'),
                ),
                // Diğer ses seçenekleri ekleyebilirsiniz
              ],
            ),
            ElevatedButton(
              onPressed: () {
                playTextToSpeech(_textFieldController.text, selectedVoice);
              },
              child: _isLoadingVoice
                  ? const LinearProgressIndicator()
                  : const Icon(Icons.volume_up),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomSource extends StreamAudioSource {
  final List<int> bytes;
  MyCustomSource(this.bytes);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= bytes.length;
    return StreamAudioResponse(
      sourceLength: bytes.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(bytes.sublist(start, end)),
      contentType: 'audio/mpeg',
    );
  }
}
