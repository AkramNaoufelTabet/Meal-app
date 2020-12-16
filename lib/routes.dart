




import 'package:flutter/material.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:food_app/screens/meal_detail_screen.dart';
import 'package:food_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

final Map<String,WidgetBuilder> routes={
  "/":(context)=>TabsScreen(),
CategoryMealsScreen.routename:(context)=>CategoryMealsScreen(),
MealDetailScreen.routename :(context)=>MealDetailScreen(),
FiltersScreen.routename :(context)=>FiltersScreen(),

};