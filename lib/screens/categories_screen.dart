import 'package:flutter/material.dart';
import 'package:food_app/widgets/category_item.dart';
import 'package:food_app/dummy_data.dart';
class CategriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
            padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(category.id, category.title, category.color);
        }).toList(),
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20
        ) ,
        
      
    );
  }
}