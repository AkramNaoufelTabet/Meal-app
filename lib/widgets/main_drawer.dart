import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {
  _buildListTile(String title,IconData icon,Function tapHandler){
       return ListTile( 
            leading: Icon(icon,size: 26,),
            title: Text(title,style: TextStyle(fontFamily: "RobotoCondensed", fontSize: 24,fontWeight: FontWeight.bold),),
            onTap: tapHandler
            ,
          );
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            child: Text("Cooking up!",
            style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30,fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 20,),
        _buildListTile("Meals", Icons.restaurant,(){
          Navigator.of(context).pushReplacementNamed("/");
        }),
        _buildListTile("Filters", Icons.settings,(){
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routename);
        })
        ],
      ),
      
    );
  }
}