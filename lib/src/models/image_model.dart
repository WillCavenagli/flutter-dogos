import 'dart:math';

class ImageModel {
  String url;
  String title;
  var random = new Random();

  ImageModel(this.url, this.title);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    url = parsedJson['message'];
    title = "Dogo ${ random.nextInt(100) }";
  }
}