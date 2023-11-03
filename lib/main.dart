import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_app/product/repository/artist_repository.dart';
import 'package:voice_app/product/repository/voice_repo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ArtistRepository(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text to Speech Conversion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  VoiceRepo.textToConvert = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Enter Text'),
            ),
            DropdownButton<String>(
              value: VoiceRepo.selectedVoice,
              onChanged: (String? newValue) {
                setState(() {
                  VoiceRepo.selectedVoice = newValue!;
                });
              },
              items: VoiceRepo.voiceOptions.map((String voice) {
                return DropdownMenuItem<String>(
                  value: voice,
                  child: Text(voice),
                );
              }).toList(),
            ),
            const ElevatedButton(
              onPressed: VoiceRepo.downloadFile,
              child: Text('Convert to Speech'),
            ),
          ],
        ),
      ),
    );
  }
}
