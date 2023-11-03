import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class VoiceRepo {
  static final String baseUrl = 'https://tts.verbatik.com/api/v1/tts';

  static final Map<String, String> headers = {
    'Content-Type': 'application/ssml+xml',
    'Authorization':
        'Bearer \$2y\$10\$qJomGdIkAM.BGHOLKuQoSusCjFfQI0dJyVCxDnG8zT5ML5FAtDXGy',
  };
  static String textToConvert = "";
  static String selectedVoice = "en-US-ChristopherNeural";

  static final List<String> voiceOptions = [
    "en-US-ChristopherNeural",
    "tr-TR-AhmetNeural",
    "tr-TR-EmelNeural",
    "ar-EG-SalmaNeural"
  ];
  static Future<void> downloadFile() async {
    final String data = """
<speak version='1.0'>
    <voice name='$selectedVoice'>$textToConvert</voice>
</speak>
    """;

    final response =
        await http.post(Uri.parse(baseUrl), headers: headers, body: data);

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
}
