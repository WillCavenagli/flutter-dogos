//Import flutter helper lib
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';
import 'dart:convert';

//StatefulWidgets are muttable and can be drawn multiple times
//Because it's a two-step method, the AppState() can be called multiple times
//Each time may return new or different widgets

//StatelessWidgets are immutable once drawn
//The build() function is called only once

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}


class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    //final response = await get('http://jsonplaceholder.typicode.com/photos/$counter');
    final response = await get('https://dog.ceo/api/breeds/image/random');
    final imageModel = new ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  //Build the structure to be displayed
  Widget build(context) {
    return MaterialApp(
    home: Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.http),
        backgroundColor: Colors.blueGrey[800],
      ),
      appBar: AppBar(
        title: Center(
          child: Text('dogos'.toUpperCase(), style: TextStyle(fontFamily: "RobotoMono"),),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
    ),
  );
  }
}