import 'package:api_test/model/wallpaper_model.dart';
import 'package:api_test/views/image_view.dart';
import 'package:flutter/material.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
      children: <TextSpan>[
        TextSpan(text: 'Stock', style: TextStyle(color: Colors.amber[900])),
        TextSpan(text: 'Wall', style: TextStyle(color: Colors.red[400])),
      ],
    ),
  );
}

/*Widget wallpaperList({List<WallpaperModel> wallpapers, context}) {
  print(wallpapers);

  // print(map1);
  // print("last was wallpaper");
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      childAspectRatio: 0.6,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: wallpapers.map((wall) {
        //   print(wall.src.potrait);
        return GridTile(
          child: Container(
            child: Image.network(wall.src.potrait),
          ),
        );
      }).toList(),
    ),
  );
}
*/

Widget wallPaperList({List<WallpaperModel> wallpapers, BuildContext context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallpapers.map((wallpaper) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ImageView(imgurl: wallpaper.src.portrait)));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  wallpaper.src.portrait,
                  fit: BoxFit.cover,
                ),
              )),
            ),
          ));
        }).toList()),
  );
}
