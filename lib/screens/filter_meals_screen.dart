import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/widgets/drawer_layout.dart';

class FilterMealsScreens extends StatelessWidget {
  static const routName = "/FilterMeals";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerLayout(),
      appBar: AppBar(title: Text('Filter Meals')),
        body: Center(
            child: Text('Filters'))
    );
  }
}
