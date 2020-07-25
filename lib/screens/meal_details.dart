import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/MealDetailScreen';
  MediaQueryData mediaQuery;
  Function toggleFavorites;
  Function isFavorite;

  MealDetailScreen(this.toggleFavorites, this.isFavorite);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text("$text", style: Theme
            .of(context)
            .textTheme
            .title));
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: mediaQuery.size.height * 0.3,
        width: mediaQuery.size.width * 0.85,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    final mealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text("${selectedMeals.title}")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: mediaQuery.size.height * 0.5,
              child: Image.network(selectedMeals.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle('Ingredients', context),
            //I cant add list view directly because it will take all the height,
            // creating conflict with the column that takes all the height
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeals.ingredients.length,
                  itemBuilder: (BuildContext context, int index) =>
                      Card(
                        color: Theme
                            .of(context)
                            .accentColor,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(selectedMeals.ingredients[index]),
                        ),
                      )),
            ),
            buildSectionTitle('steps', context),
            buildContainer(ListView.builder(
              itemCount: selectedMeals.steps.length,
              itemBuilder: (context, index) =>
                  Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(child: Text("${index + 1}")),
                        title: Text("${selectedMeals.steps[index]}"),
                      ),
                      Divider(thickness: 1, color: Colors.black,)
                    ],
                  ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorites(mealId),
      ),
    );
  }
}

