import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/meal_item.dart';
class FavouriteScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;
  FavouriteScreen(
    this._favouriteMeals,
  );
  @override
  Widget build(BuildContext context) {
    if (_favouriteMeals.isEmpty){
  return Container(
      child: Center(child: Text('You have no favourite meals yet - start adding some'),),
    );
    }else{
      return ListView.builder(
        itemCount: _favouriteMeals.length,
        itemBuilder: (context,index){
          return MealItem(_favouriteMeals[index]);
          
        });
    }
  
  }
}