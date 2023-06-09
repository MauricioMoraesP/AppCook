import 'package:appcook/utils/app_routes.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    required this.category,
  });

  void _selectedCategory(BuildContext context) {
    /*Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScreen(category);
        },
      ),
    );*/
    Navigator.of(context)
        .pushNamed(AppRoutes.CATEGORIES_MEALS, arguments: category);
  }

//Esta parte se refere ao momento em que eu pressiono um dos meus
//dispositivos/botões disponíveis no meu gridview
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return _selectedCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
