import 'dart:convert';

import 'package:http/http.dart' show get;
import 'dart:io' show File;

import 'package:path_provider/path_provider.dart';

class FileUitls {
  Future<String> loadAndSaveFiles(String audioUrl) async {
    try {
      var audioRes = await get(audioUrl);
      final RegExp regExp = RegExp('([^?/]*\.(mp3))');
      String audioFileName = regExp.stringMatch(audioUrl);

      final pathDir = await getApplicationDocumentsDirectory();
      File audio = File(pathDir.path + "/" + audioFileName);

      bool audioExist = await audio.exists();

      if (!audioExist) {
        audio.writeAsBytesSync(audioRes.bodyBytes);
        print("Saved to local storage as audio file.");
      }
      print("Files exits in local.");
      return audio.path;
    } catch (e) {
      print("[ERROR INFO] $e");
    }
  }
}
