import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
class TabsScreen extends StatefulWidget {

  final List<Meal> _favouriteMeals;
  
  TabsScreen(
    this._favouriteMeals,
  );  
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 
  List<Map<String,Object>> pages;
 int _seledtedPageIndex=0;

 void _selectedPage(int index){
   setState(() {
     _seledtedPageIndex=index;
   });
 }

 @override
  void initState() {
    pages=[
     {'page':CategriesScreen(),'title':"Categories"}, 
     {'page':FavouriteScreen(widget._favouriteMeals),'title':"Your favourite"}
    ];
    
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text(pages[_seledtedPageIndex]['title']),
        
      ),
      drawer: MainDrawer(),
      body: pages[_seledtedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _seledtedPageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),
          label: 'Catgegories',
          backgroundColor: Theme.of(context).primaryColor,
           ),
           BottomNavigationBarItem(icon: Icon(Icons.favorite_border),
          label: 'Favourite',
         backgroundColor: Theme.of(context).primaryColor,
           ),
        ],
      ),
      
    );
  }
}