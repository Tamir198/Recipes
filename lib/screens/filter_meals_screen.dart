import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/widgets/drawer_layout.dart';

class FilterMealsScreens extends StatefulWidget {
  static const routName = "/FilterMeals";

  //Function that wll be passed out from the main.dart file to this screen to filter the meal grid view
  final Function saveFilters;
  Map<String, bool> currentSelectedFilters;

  FilterMealsScreens(this.currentSelectedFilters,this.saveFilters);

  @override
  _FilterMealsScreensState createState() => _FilterMealsScreensState();
}

Widget createListSwitchTile(
    String title, String description, bool currValue, Function updateValue) {
  return SwitchListTile(
      title: Text(title),
      value: currValue,
      subtitle: Text(description),
      onChanged: updateValue);
}

class _FilterMealsScreensState extends State<FilterMealsScreens> {
  bool isGlutenFree = false,
      isVegan = false,
      isVegetarian = false,
      isLactoseFree = false;
  @override
  void initState() {
    isGlutenFree = widget.currentSelectedFilters['gluten'];
    isLactoseFree = widget.currentSelectedFilters['lactose'];
    isVegetarian = widget.currentSelectedFilters['vegetarian'];
    isVegan = widget.currentSelectedFilters['vegan'];

      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerLayout(),
        appBar: AppBar(
          title: Text('Filter Meals'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              //Access the method that is inside the widget and not the state
              onPressed: (){
                final  Map<String,bool> selectedFilters =  {
                'gluten' : isGlutenFree,
                'lactose' : isLactoseFree,
                'vegetarian' : isVegetarian,
                'vegan' : isVegan,
                };
                widget.saveFilters(selectedFilters);

              },
            )
          ],),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Filter your meal',
                  style: Theme.of(context).textTheme.title,
                )),
            Expanded(
                child: ListView(
              children: <Widget>[
                createListSwitchTile('Gluten Free', 'Only include gluten free meals',
                    isGlutenFree, (newValue) {
                     setState(() {
                      isGlutenFree = newValue;
                   });
                }),
                createListSwitchTile(
                    'Lactose Free',
                    'Only include Lactose free meals',
                    isLactoseFree, (newValue) {
                     setState(() {
                     isLactoseFree = newValue;
                   });
                }),
                createListSwitchTile(
                    'Vegetarian Free',
                    'Only include Vegetarian free meals',
                    isVegetarian, (newValue) {
                     setState(() {
                       isVegetarian = newValue;
                  });
                }),
                createListSwitchTile(
                    'Vegan', 'Only include isVegan free meals',
                    isVegan, (newValue) {
                      setState(() {
                       isVegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
