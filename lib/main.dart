import 'package:flutter/material.dart';
import 'file:///C:/Users/The%20Vegan/Desktop/Recipes/recipes/Recipes/lib/screens/category_screens.dart';
import 'screens/categories_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

      home: Scaffold(
          appBar: AppBar(title: Text('Recipes'),),
          body: CategoriesScreen()),
      routes: {
        //This is another way to navigate between pages in flutter
        //I can write
        // /screen-rout : (context) => CategoryMealScreen() but easy to make grammar mistakes
        CategoryMealScreen.routName : (context) => CategoryMealScreen()
      },
    );
  }
}

