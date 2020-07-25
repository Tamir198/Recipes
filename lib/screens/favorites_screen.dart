import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if (favoriteMeals.isEmpty)
    return Column(children: <Widget>[
      Text('no favorites',style: Theme.of(context).textTheme.title,),
      Image(image: AssetImage('lib/assets/images/addFood.png'))
    ]);
    else{
      return  ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imgUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
            );
          }, itemCount: favoriteMeals.length);

    }
  }
}
