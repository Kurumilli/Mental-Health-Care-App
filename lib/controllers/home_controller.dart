import 'package:logger/logger.dart';
import 'package:flutter_application_1/models/video_model.dart';
import 'package:flutter_application_1/services/api/quotes_api_service.dart';
import 'package:flutter_application_1/services/api/remote_service.dart';
import 'package:get/get.dart';

final logger = Logger();

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var isLoading = true.obs;
  var videoList = Snippet().obs;
  var pgToken = 'EAAaBlBUOkNBVQ'.obs;

  var snippetList = <Snippet>[].obs;
  var quote = "".obs;
  var author = "".obs;

  String get quoteText => quote.value;
  String get quoteAuthor => author.value;

  void fetchVideos() async {
    try {
      isLoading(true);
      snippetList.clear();
      var videos = await RemoteServices.fetchVideos(pgToken.value);

      if (videos.nextPageToken != null) {
        pgToken.value = videos.nextPageToken!;
      }

      List<Item>? dat = videos.items;
      if (dat != null && dat.isNotEmpty) {
        snippetList.addAll(dat.map((e) => e.snippet!).whereType<Snippet>());
      }
    } catch (e, stackTrace) {
      logger.e("Error fetching videos", error: e, stackTrace: stackTrace);
    } finally {
      isLoading(false);
    }
  }

  void fetchQuote() async {
    try {
      isLoading(true);
      var result = await QuotesApiService.fetchQuote();
      if (result != null) {
        quote.value = result['content'];
        author.value = result['author'];
      } else {
        quote.value = "No quote available.";
        author.value = "";
      }
    } catch (e, stackTrace) {
      logger.e("Error fetching quote", error: e, stackTrace: stackTrace);
      quote.value = "Failed to load quote.";
      author.value = "";
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchQuote();
  }

  @override
  void onReady() {
    super.onReady();
    fetchVideos();
  }
}
