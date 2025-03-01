import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';  // Import the logging package

// Create the logger globally, so it is accessible in the QuotesApiService class.
final Logger _logger = Logger('QuotesApiService');  // Create a global logger instance

class QuotesApiService {
  static var client = http.Client();

  static Future<Map<String, dynamic>?> fetchQuote() async {
    try {
      var response = await client.get(Uri.parse('https://zenquotes.io'));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData[0]; // Get the first quote object
      } else {
        _logger.severe('Error: Server responded: ${response.statusCode}');  // Log error
        Get.snackbar('Error', 'Server responded: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      _logger.severe('Failed to load quote: $e');  // Log exception
      Get.snackbar('Error', 'Failed to load quote: $e');
      return null;
    }
  }
}

void getQuote() async {
  var quote = await QuotesApiService.fetchQuote();
  if (quote != null) {
    _logger.info("${quote['q']} - ${quote['a']}");  // Log the quote info
    Get.snackbar('Quote', "${quote['q']} - ${quote['a']}");  // Optionally show in Snackbar
  }
}
