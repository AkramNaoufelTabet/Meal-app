import 'package:flutter/material.dart';
import 'package:food_app/widgets/main_drawer.dart'; 
class FiltersScreen extends StatelessWidget {
 static String routename="/filters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"),),
      drawer: MainDrawer(),
      body: Center(child: Text("Filters!"),),
    );
  }
}