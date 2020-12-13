import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/widgets/meal_item.dart';
class CategoryMealsScreen extends StatelessWidget {
  // final String id,title;
  // CategoryMealsScreen(this.id,this.title);
  static String routename="/categoryMeals";
  @override
  Widget build(BuildContext context) {
    final routeargs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final _ctitle=routeargs['title'];
    final _cId=routeargs['id'];
    final categoryMeals=DUMMY_MEALS.where((meal){
      return meal.categories.contains(_cId);
    } ).toList();
    return Scaffold(
      appBar: AppBar(title: Text("$_ctitle"),
      
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context,index){
          return MealItem(categoryMeals[index]);
          
        })
    );
  }
}