import 'package:flutter/material.dart';
import 'package:food_app/widgets/main_drawer.dart'; 
class FiltersScreen extends StatefulWidget {
 static String routename="/filters";

 final Function saveFilters;
 final Map<String,bool> _currentFilters;
 FiltersScreen(
   this.saveFilters,
   this._currentFilters,
 );




  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  
  
  Widget _buildSwitcher(String title,description,var currentValue,Function update){
    
    return   SwitchListTile(
                title: Text(title),
                subtitle: Text(description),
                value: currentValue, onChanged:update );
  }
  var _glutenFree=false;
  var _vegan=false;
  var _vegetarian=false;
  var _lactoseFree=false;
  @override
  void initState() {
    _glutenFree=widget._currentFilters['gluten'];
    _vegan=widget._currentFilters['vegan'];
    _lactoseFree=widget._currentFilters['lactose'];
    _vegetarian=widget._currentFilters['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Filters"),
      actions: [
        IconButton(icon: Icon(Icons.save), onPressed: (){
           final  selectedFilters={
                     'gluten':_glutenFree,
                     'lactose':_lactoseFree,
                      'vegan':_vegan,
                      'vegetarian':_vegetarian,
                };
                widget.saveFilters(selectedFilters);
        })
      ],
      ),
      drawer: MainDrawer(),
      body: Column(

        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection",
            style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
            children: [
            _buildSwitcher("Gluten-free", 'Only include gluten-free meals.', _glutenFree, (newvalue){
              setState(() {
                _glutenFree=newvalue;
                
              });

            }),
            _buildSwitcher("Lactose-free", 'Only include lactose-free meals.', _lactoseFree, (newvalue){
              setState(() {
                _lactoseFree=newvalue;
              });

            }),
            _buildSwitcher("Vegetarian", 'Only include vegetarian meals.', _vegetarian, (newvalue){
              setState(() {
                _vegetarian=newvalue;
              });

            }),
            _buildSwitcher("Vegan", 'Only include vegan meals.', _vegan, (newvalue){
              setState(() {
                _vegan=newvalue;
              });

            })

            ],
          ))
        ],
      )
      
    );
  }
}