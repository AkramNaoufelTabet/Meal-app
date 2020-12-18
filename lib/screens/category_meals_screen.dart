import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import '../model/meal.dart';
import 'package:food_app/widgets/meal_item.dart';
class CategoryMealsScreen extends StatefulWidget {
  // final String id,title;
  // CategoryMealsScreen(this.id,this.title);
  static String routename="/categoryMeals";
  final List<Meal> _availableMeals;
  CategoryMealsScreen(
    this._availableMeals,
  );

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeargs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final _ctitle=routeargs['title'];
    final _cId=routeargs['id'];
    final categoryMeals=widget._availableMeals.where((meal){
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