import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String url = "https://tts.verbatik.com/api/v1/tts";
  final Map<String, String> headers = {
    'Content-Type': 'application/ssml+xml',
    'Authorization':
        'Bearer \$2y\$10\$qJomGdIkAM.BGHOLKuQoSusCjFfQI0dJyVCxDnG8zT5ML5FAtDXGy',
  };

  String textToConvert = "";
  String selectedVoice = "en-US-ChristopherNeural";

  final List<String> voiceOptions = [
    "en-US-ChristopherNeural",
    "tr-TR-AhmetNeural",
    "tr-TR-EmelNeural",
  ];

  Future<void> downloadFile() async {
    final String data = """
<speak version='1.0'>
    <voice name='$selectedVoice'>$textToConvert</voice>
</speak>
    """;

    final response =
        await http.post(Uri.parse(url), headers: headers, body: data);

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final fileName = 'output.mp3';
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      File file = File(filePath);

      await file.writeAsBytes(bytes);
      print('File downloaded to: $filePath');
    } else {
      throw Exception('Failed to download file');
    }
  }

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
                  textToConvert = value;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            DropdownButton<String>(
              value: selectedVoice,
              onChanged: (String? newValue) {
                setState(() {
                  selectedVoice = newValue!;
                });
              },
              items: voiceOptions.map((String voice) {
                return DropdownMenuItem<String>(
                  value: voice,
                  child: Text(voice),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: downloadFile,
              child: Text('Convert to Speech'),
            ),
          ],
        ),
      ),
    );
  }
}
