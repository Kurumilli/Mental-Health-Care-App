import 'dart:convert';

List<QuotesModel> quotesModelFromJson(String str) => List<QuotesModel>.from(
    json.decode(str).map((x) => QuotesModel.fromJson(x)));

String quotesModelToJson(List<QuotesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotesModel {
  QuotesModel({
    this.quote,
    this.author,
  });

  String? quote;
  String? author;

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        quote: json["q"], // Correct key
        author: json["a"], // Correct key
      );

  Map<String, dynamic> toJson() => {
        "q": quote, // Ensure correct key names
        "a": author,
      };
}
