// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Waifu waifuFromJson(String str) => Waifu.fromJson(json.decode(str));

String waifuToJson(Waifu data) => json.encode(data.toJson());

class Waifu {
  Waifu({
    required this.url,
  });

  String url;

  factory Waifu.fromJson(Map<String, dynamic> json) => Waifu(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
