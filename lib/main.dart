import 'package:flutter/material.dart';
import './routes.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      routes: routes,
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