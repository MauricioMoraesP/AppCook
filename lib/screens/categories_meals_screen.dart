import 'package:appcook/components/meal_item.dart';
import 'package:appcook/data/dummy_data.dart';
import 'package:appcook/models/category.dart';
import 'package:flutter/material.dart';

import '../models/meals.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals);
  //É para criar uma rota com base nos pratos que tenho sobre cada comida!
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
        backgroundColor: category.color,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(meal: categoryMeals[index]);
            }),
      ),
    );
  }
}
