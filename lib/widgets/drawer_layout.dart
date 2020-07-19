import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/screens/filter_meals_screen.dart';


class DrawerLayout extends StatelessWidget {

  //I am using a function and not a widget because this widget will not manage any state
  //If it will need to manage some state - use widget so the build method of this widget will get called
  //and not the build method of the widget tree
  Widget createListTile (String title, IconData icon, Function itemPressed){
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title, style: TextStyle(
          fontFamily: 'fontFamily',
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
      ),
      onTap: itemPressed,
    );
  }

  void moveScreen(String routName, BuildContext context){
    //Replace the current screen with new one and not just add to stack
    Navigator.of(context).pushReplacementNamed(routName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 120,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text('Meals', style:
          TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor
            ),
          ),
        ),
        SizedBox(height: 20),
        createListTile('Meals', Icons.restaurant, () => moveScreen('/',context)),
        createListTile('Settings',Icons.settings,() => moveScreen(FilterMealsScreens.routName, context))
      ],
    ),);
  }
}
