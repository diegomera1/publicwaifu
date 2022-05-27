import 'package:flutter/foundation.dart';
import 'package:public/models/waifu.dart';
import 'package:http/http.dart' as http;

class WaifuApi {
  Future<Waifu> getWaifu() async {
    String urlBase = "https://api.waifu.pics";
    String endpoint = "/nsfw/waifu";
    final http.Response response =
        await http.get(Uri.parse(urlBase + endpoint));

    return compute(waifuFromJson, response.body);
  }
}
