import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {@required this.title,
      @required this.imgUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  void selectMeal() {}

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';
    }
  }


    String get affordabilityText{

      switch (affordability){

        case Affordability.Affordable:
          return 'Affordable';

        case Affordability.Pricey:
          return 'Pricey';

        case Affordability.Luxurious:
          return 'Luxurious';

      }
  }

  @override
  Widget build(BuildContext context) {
    Radius borderRadius = Radius.circular(16);
    return InkWell(
        onTap: selectMeal,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  //ClipRRect - use it to force any child widget into a certain shape
                  //for example - in flutter you cant clip images (not supported) so you use ClipRRect
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: borderRadius, topRight: borderRadius),
                    child: Image.network(imgUrl,
                        height: 250, width: double.infinity, fit: BoxFit.cover),
                  ),
                  //Where to pace the text according to the largest stack widget (the image in my case)
                  Positioned(
                    //Now the text will be wrapped with position(only available in stack) and be displayed in the bottom right corner
                    bottom: 20,
                    right: 10,
                    //This container is to let the text overFlow in case of large text
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(title,
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                          //The text if too long is wrapped
                          softWrap: true,
                          //if the text does not fit the box it will fade out and not overflow
                          overflow: TextOverflow.fade),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('$duration  min'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text(affordabilityText),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
