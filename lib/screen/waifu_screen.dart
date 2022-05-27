import 'package:flutter/material.dart';
import 'package:public/models/waifu.dart';
import 'package:public/apis/waifu_api.dart';

class WaifuScreen extends StatefulWidget {
  const WaifuScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WaifuScreen> createState() => _WaifuScreenState();
}

class _WaifuScreenState extends State<WaifuScreen> {
  String imageUri =
      "https://www.vuescript.com/wp-content/uploads/2018/11/Show-Loader-During-Image-Loading-vue-load-image.png";
  bool isfirstLoad = true;
  void fetchWaifu() async {
    Waifu newWaifuInfo = await WaifuApi().getWaifu();
    setState(() {
      imageUri = newWaifuInfo.url;
      isfirstLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isfirstLoad) fetchWaifu();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.80,
            child: Container(
              decoration: BoxDecoration(color: Colors.blue[50]),
              child: Image.network(
                imageUri,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: fetchWaifu,
            child: const Text("New Waifu"),
          ),
        ],
      )),
    );
  }
}
