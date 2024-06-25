import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/view/widget/search_recipe.dart';

class RecipeHome extends StatelessWidget {
  const RecipeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async {
            final String? query = await showSearch(
                context: context, delegate: SearchRecipe());
          }, icon: Icon(Icons.search))
        ],
      ),
    );
  }
}
