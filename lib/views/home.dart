import 'dart:convert';

import 'package:api_test/Widgets/widget.dart';
import 'package:api_test/data/data.dart';
import 'package:api_test/model/categories_model.dart';
import 'package:api_test/model/wallpaper_model.dart';
import 'package:api_test/views/category.dart';
import 'package:api_test/views/image_view.dart';
import 'package:api_test/views/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  TextEditingController searchController = new TextEditingController();
  ScrollController _controller = new ScrollController();

  getTrendingWallpaper() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=100&page=1"),
        headers: {"Authorization": apiKey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    /*_controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        print("Reaching end $_controller");
      }
    });*/

    getTrendingWallpaper();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search Wallpaper",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                    searchQuery: searchController.text)));
                      },
                      child: Icon(Icons.search))
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                height: 80,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    scrollDirection: Axis.horizontal,
                    //shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Tile(
                          imgUrl: categories[index].url,
                          title: categories[index].name);
                    })),
            SizedBox(
              height: 16,
            ),

            wallPaperList(wallpapers: wallpapers, context: context)

            // print(scrollController.offset);
          ],
        )),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  // const Tile({Key key}) : super(key: key);

  final String imgUrl, title;
  Tile({@required this.imgUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categorie(
                      query: title.toLowerCase(),
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(right: 3),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(imgUrl,
                      height: 50, width: 100, fit: BoxFit.cover)),
              Container(
                height: 50,
                width: 100,
                alignment: Alignment.center,
                color: Colors.black26,
                child: Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              )
            ],
          )),
    );
  }
}
