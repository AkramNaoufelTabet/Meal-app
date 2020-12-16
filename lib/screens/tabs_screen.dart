import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 
 final List<Map<String,Object>> pages=[
     {'page':CategriesScreen(),'title':"Categories"}, 
     {'page':FavouriteScreen(),'title':"Your favourite"}
    ];
 int _seledtedPageIndex=0;

 void _selectedPage(int index){
   setState(() {
     _seledtedPageIndex=index;
   });
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