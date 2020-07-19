import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static final String routName = '/CategoryMealScreen';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List <Meal> displayedMeals;
  bool hasDataInitialized = false;

  @override
  void initState() {
    super.initState();

  }

  //This will be called when the widget that belongs to the state has been  fully initialized and we can access context
  //YOU CAN NOT do it inside "initState", its roo early
  @override
  void didChangeDependencies() {
    //The if is to make sure that this code will called only for the first time
    //Because didChangeDependencies is triggered a lot of times
    if(!hasDataInitialized){
      //Receive the values from the previous screen, those value were sent as map of strings
      final routArguments = ModalRoute.of(context).settings.arguments as Map <String, String>;
      final String categoryId = routArguments['id'];
      categoryTitle = routArguments['title'];
      //This is the filtered list category according to the DUMMY_MEALS data
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      hasDataInitialized = true;
    }else


    super.didChangeDependencies();
  }

  removeMeal(String mealId){
    setState(() {
      //deletes an item with the date from a screen that got poped via navigator.pop
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imgUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                affordability: displayedMeals[index].affordability,
                complexity: displayedMeals[index].complexity,
                removeItem: removeMeal,

            );
          }, itemCount: displayedMeals.length,)
    );
  }
}
