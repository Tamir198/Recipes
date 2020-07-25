import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  MediaQueryData mediaQuery;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);

    if (favoriteMeals.isEmpty)
    return Column(children: <Widget>[
      SizedBox(height: mediaQuery.size.height * 0.05),
      Text('You don`t have any favorites',style: Theme.of(context).textTheme.title),
      SizedBox(height: mediaQuery.size.height * 0.1),
      Image(
          image: AssetImage('lib/assets/images/addFood.png'),
          height: mediaQuery.size.height * 0.5,
          width: mediaQuery.size.height * 1,
      )
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
