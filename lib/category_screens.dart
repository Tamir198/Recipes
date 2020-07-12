import 'package:flutter/cupertino.dart';
import 'dummy_data.dart';
import 'categoty_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      //Inserting items to the gridView
      children: DUMMY_CATEGORIES.map((categoryData) => CategoryItem(
          title: categoryData.title,
          color: categoryData.color,
      )).toList(),

      //The look of the grid
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
