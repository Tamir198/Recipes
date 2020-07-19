import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/screens/filter_meals_screen.dart';
import 'package:recipes/screens/meal_details.dart';
import 'package:recipes/screens/tabs_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> filters = {
    'gluten' : false,
    'lactose' : false,
    'vegetarian' : false,
    'vegan' : false,
  };

  //Creating this list so I can manage what to show based on the user meals preferences in filter screen
  //This will be used un categoryMeals instead of the DUMMY_MEALS
  List <Meal> availableMeals = DUMMY_MEALS;

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



  @override
  Widget build(BuildContext context) {
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
        '/': (context) => TabsScreen(),
        CategoryMealScreen.routName : (context) => CategoryMealScreen(availableMeals),
        MealDetailScreen.routName : (context) => MealDetailScreen(),
        FilterMealsScreens.routName : (context) => FilterMealsScreens(filters,setFilters)
      },
      //If flutter will fail to show some screen you can show something like 'page nto found'
      onUnknownRoute: (setting){
        return MaterialPageRoute(builder: (context) => CategoryMealScreen(availableMeals));

      },
    );
  }
}

