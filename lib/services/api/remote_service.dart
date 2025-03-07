
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/models/video_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<VideoModel> fetchVideos(String nextPageToken) async {
    var url = Uri.https(
      'youtube.googleapis.com',
      '/youtube/v3/playlistItems',
      {
        'key': youtubeApiKey,
        'playlistId': 'PLUKRqQ8cSB-DCDuEl5vYogIMH9ph-7OP7',
        'part': 'snippet',
        'pageToken': nextPageToken,
      },
    );
    var response = await client.get(url);

    if (response.statusCode != 200) {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
    var jsonString = response.body;
    return videoModelFromJson(jsonString);
  }
}
