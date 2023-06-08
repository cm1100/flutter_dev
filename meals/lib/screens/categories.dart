import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  final bool? notDisplayScaffold;

  final List<Meal> availibleMeals;

  const CategoriesScreen(
      {super.key, this.notDisplayScaffold, required this.availibleMeals});

  void _selectCategory(BuildContext context, Category category) {
    final filtered = availibleMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filtered,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );

    if (notDisplayScaffold == true) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your Category'),
      ),
      body: content,
    );
  }
}
