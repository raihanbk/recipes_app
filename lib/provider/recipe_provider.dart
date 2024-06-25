import 'package:flutter/material.dart';
import 'package:recipes_app/service/recipe_service.dart';
import '../model/recipe_model.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> _filteredRecipe = [];


  List<Recipe> get recipes =>
      _filteredRecipe.isNotEmpty ? _recipes : _filteredRecipe;

  Future<void> getRecipes() async {
    try {
      var recipe = await RecipeService.fetchRecipes();
      _recipes = recipe.recipes ?? [];
      _filteredRecipe = _recipes;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> searchRecipe(String query) async {
    _filteredRecipe = _recipes.where((element) {
      return element.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
