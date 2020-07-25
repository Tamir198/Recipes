import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/screens/tabs_screen.dart';

import '../dummy_data.dart';
import 'categories_meals_screen.dart';
import 'filter_meals_screen.dart';
import 'meal_details.dart';

class MealsApp extends StatefulWidget {
  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<MealsApp> {
  Map<String,bool> filters = {
    'gluten' : false,
    'lactose' : false,
    'vegetarian' : false,
    'vegan' : false,
  };

  //Creating this list so I can manage what to show based on the user meals preferences in filter screen
  //This will be used un categoryMeals instead of the DUMMY_MEALS
  List <Meal> availableMeals = DUMMY_MEALS;
  List <Meal> favoriteMeals = [];

  //This will be called inside filterMeals screen and update the meals
  void setFilters( Map<String,bool> filtersData ){
    setState(() {
      filters = filtersData;
      availableMeals  = DUMMY_MEALS.where((meal) {
        //true = keep the meal, false = don`t keep it
        if(filters['gluten'] && !meal.isGlutenFree)
          return false;

        if(filters['lactose'] && !meal.isLactoseFree)
          return false;

        if(filters['vegetarian'] && !meal.isVegetarian)
          return false;

        if(filters['vegan'] && !meal.isVegan)
          return false;

        return true;

      }).toList();
    });
  }

  void toggleFavorites(String mealId){
    //Return -1 if condition is not met
    final favoriteIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    //favoriteIndex contains a meal that I want to remove from favorite list
    if(favoriteIndex >= 0){
      setState(() {
        favoriteMeals.removeAt(favoriteIndex);
      });

    }else{
      //Add the first meal with the same id as favoriteIndex and add it ot the favorites list
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavorite(String id){
    return favoriteMeals.any((meal) => meal.id == id);
  }



  @override
  Widget build(  BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoCondensed-Bold',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),

      /* home: Scaffold(
          appBar: AppBar(title: Text('Recipes'),),
          body: CategoriesScreen()),*/
      routes: {
        //This is another way to navigate between pages in flutter
        //I can write
        // /screen-rout : (context) => CategoryMealScreen() but easy to make grammar mistakes
        //Default page of the app
        '/': (context) => TabsScreen(favoriteMeals),
        CategoryMealScreen.routName : (context) => CategoryMealScreen(availableMeals),
        MealDetailScreen.routName : (context) => MealDetailScreen(toggleFavorites,isFavorite),
        FilterMealsScreens.routName : (context) => FilterMealsScreens(filters,setFilters)
      },
      //If flutter will fail to show some screen you can show something like 'page nto found'
      onUnknownRoute: (setting){
        return MaterialPageRoute(builder: (context) => CategoryMealScreen(availableMeals));

      },
    );
  }
}