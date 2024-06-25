import 'package:recipes_app/model/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeService {

  static Future<Recipes> fetchRecipes() async {
    var url = 'https://dummyjson.com/recipes';
    var uri = Uri.parse(url);
    var response = await http.get(uri);

    if(response.statusCode == 200) {
      return recipesFromJson(response.body);
    } else {
      throw Exception('Failed to load...');
    }
  }
}