import 'package:api_test/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001b91e8223403840fd84d6d03558042712";

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];
  CategoriesModel categorieModel = new CategoriesModel();

  categorieModel.name = "Birds";
  categorieModel.url =
      "https://images.pexels.com/photos/1406506/pexels-photo-1406506.jpeg?auto=compress&cs=tinysrgb";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  categorieModel.name = "Animals";
  categorieModel.url =
      "https://images.pexels.com/photos/87403/cheetah-leopard-animal-big-87403.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  categorieModel.name = "City";
  categorieModel.url =
      "https://images.pexels.com/photos/2129796/pexels-photo-2129796.png?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  categorieModel.name = "People";
  categorieModel.url =
      "https://images.pexels.com/photos/4723552/pexels-photo-4723552.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  categorieModel.name = "Dogss";
  categorieModel.url =
      "https://images.pexels.com/photos/895259/pexels-photo-895259.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  categorieModel.name = "Cafe";
  categorieModel.url =
      "https://images.pexels.com/photos/3133859/pexels-photo-3133859.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  categorieModel.name = "Covid";
  categorieModel.url =
      "https://images.pexels.com/photos/5995171/pexels-photo-5995171.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  return categories;
}
