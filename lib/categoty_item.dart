import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
   final String id;
   final String title;
   final Color color;


  CategoryItem(this.id, this.title, this.color);


  void selectCategory(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
      return CategoryMealScreen(id,title);
    }));
  }

  @override
  Widget build(BuildContext context) {
    //InkWell makes the touches on the views looks better
    //Here is how you will configure them
    return InkWell(
      onTap: () => selectCategory(context),
      //This is the design of the tap effect on the view
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),

      child: Container(
        padding: EdgeInsets.all(16),
        child: Text(title, style: Theme
            .of(context)
            .textTheme
            .headline6,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}


