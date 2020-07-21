import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/screens/category_screens.dart';
import 'package:recipes/screens/favorites_screen.dart';
import 'package:recipes/widgets/drawer_layout.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: DrawerLayout(),
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories'
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites'
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          //The order of the tabs inside TabBar will be the order of the screens that will be displayed
          CategoriesScreen(),
          FavoritesScreen(widget.favoriteMeals),
        ],
        ),
      ),
    );
  }
}
