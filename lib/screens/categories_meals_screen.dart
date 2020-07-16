import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Receive the values from the previous screen, those value were sent as map of strings
    final routArguments = ModalRoute.of(context).settings.arguments as Map <String,String>;
    final String categoryId = routArguments['id'];
    final String categoryTitle = routArguments['title'];

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: Text(categoryId),
      ),
    );
  }
}
