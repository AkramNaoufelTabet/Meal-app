import 'package:flutter/material.dart';
import './dummy_data.dart';
import './model/meal.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,

 };
  List<Meal> _availableMeals=DUMMY_MEALS;
  List<Meal> _favouriteMeals=[];
 void _setFilters( Map<String,bool> filterData){
   setState(() {
     _filters=filterData;
     _availableMeals=DUMMY_MEALS.where((meal) {

       if(_filters['gluten']&& meal.isGlutenFree)
       return true;
         if(_filters['lactose']&& meal.isLactoseFree)
       return true;
         if(_filters['vegetarian']&& meal.isVegetarian)
       return true;
         if(_filters['vegan']&& meal.isVegan)
       return true;
      return false;
      
      // return true;
       

     }).toList();


   });
 }
 void _toggleFavourite(String mealId){
   final existingMeal=_favouriteMeals.indexWhere((meal) => meal.id==mealId);
    if (existingMeal>=0){
      setState(() {
        _favouriteMeals.removeAt(existingMeal);
      });
      
    }else{
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id==mealId)
        );
      });
    }
 }
bool _isFavourite(String id){
  return _favouriteMeals.any((meal) => meal.id==id);
}
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      
      theme: ThemeData(
        
        
        
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2:  TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6:TextStyle(fontFamily: 'RobotoCondensed',fontSize: 20), 
        ),
        
      
      ),
      routes: {
  "/":(context)=>TabsScreen(_favouriteMeals),
CategoryMealsScreen.routename:(context)=>CategoryMealsScreen(_availableMeals),
MealDetailScreen.routename :(context)=>MealDetailScreen(_toggleFavourite,_isFavourite),
FiltersScreen.routename :(context)=>FiltersScreen(_setFilters,_filters),

},
      initialRoute: '/',
      //home:CategriesScreen()
    );
  }

}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key key ,
    this.title
  }  ):super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.title}"),
      ),
      body: Center(child: Text("Navigation time ! "),),
      
    );
  }
}