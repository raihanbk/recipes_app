import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/provider/recipe_provider.dart';

import '../../model/recipe_model.dart';

class SearchRecipe extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final List<Recipe> suggestions = query.isEmpty
        ? []
        : recipeProvider.recipes
            .where((recipe) =>
                recipe.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index].name ?? ''),
            onTap: () {
              close(context, suggestions[index].name ?? '');
            },
          );
        });
  }
}
