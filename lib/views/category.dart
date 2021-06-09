import 'dart:convert';

import 'package:api_test/Widgets/widget.dart';
import 'package:api_test/data/data.dart';
import 'package:api_test/model/wallpaper_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categorie extends StatefulWidget {
  final String query;

  Categorie({this.query});

  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapers = [];

  getSearchWallpaper(String searchQuery) async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$searchQuery"),
        headers: {"Authorization": apiKey});

    //  print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);

      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
      // print(wallpaperModel.toString())
    });

    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpaper(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Container(
              child: Column(children: <Widget>[
        SizedBox(
          height: 16,
        ),
        wallPaperList(wallpapers: wallpapers, context: context),
      ]))),
    );
  }
}
