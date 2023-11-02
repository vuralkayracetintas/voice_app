import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:voice_app/core/demo.dart';
import 'package:voice_app/core/screens/home/home.dart';
import 'package:voice_app/product/repository/artist_repository.dart';
import 'dart:io';

import 'package:voice_app/product/repository/voice_repo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ArtistRepository(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to Speech Conversion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  VoiceRepo.textToConvert = value;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Text'),
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
            ElevatedButton(
              onPressed: VoiceRepo.downloadFile,
              child: Text('Convert to Speech'),
            ),
          ],
        ),
      ),
    );
  }
}
