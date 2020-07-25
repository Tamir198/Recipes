import 'package:flutter/cupertino.dart';
import '../dummy_data.dart';
import '../widgets/categoty_item.dart';

class CategoriesScreen extends StatelessWidget {
  MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    return GridView(
      //The const part makes sure that `EdgeInsets.all(25.0)` will only create 1 time
      padding: const EdgeInsets.all(25.0),
      //Inserting items to the gridView
      children: DUMMY_CATEGORIES.map((categoryData) =>  CategoryItem(
          categoryData.id,
          categoryData.title,
          categoryData.color
        )).toList(),

      //The look of the grid
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: mediaQuery.size.height * 0.45,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: mediaQuery.size.width * 0.01,
          mainAxisSpacing: mediaQuery.size.height * 0.01),
    );
  }
}
