
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryMealScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    print(categoryId + '  Whyy');
    print(categoryTitle + '  Whyy');
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: Text(categoryId),
      ),
    );
  }
}
