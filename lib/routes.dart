

import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

final Map<String,WidgetBuilder> routes={
  "/":(context)=>CategriesScreen(),
CategoryMealsScreen.routename:(context)=>CategoryMealsScreen(),

};