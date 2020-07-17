import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static final String routName = '/CategoryMealScreen';

  @override
  Widget build(BuildContext context) {
    //Receive the values from the previous screen, those value were sent as map of strings
    final routArguments = ModalRoute
        .of(context)
        .settings
        .arguments as Map <String, String>;
    final String categoryId = routArguments['id'];
    final String categoryTitle = routArguments['title'];
    //This is the filtered list category according to the DUMMY_MEALS data
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(title: categoryMeals[index].title,
                imgUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
            );
          }, itemCount: categoryMeals.length,)
    );
  }
}
