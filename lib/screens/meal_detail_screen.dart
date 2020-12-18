import 'package:flutter/material.dart';
import 'package:food_app/model/meal.dart';
class MealDetailScreen extends StatelessWidget {
  static String routename="/mealDetail"; 
  final Function _toggleFavourite;
  final Function isFavourite;
  MealDetailScreen(this._toggleFavourite,
  this.isFavourite);

  Widget _buildSectionTitle(BuildContext context,String text){
    return  Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(text,style: Theme.of(context).textTheme.headline6,),
          );
  }
  Widget _buildContainer(Widget child){
         return Container(
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all( 
              color: Colors.grey
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: child
         );
  }
  @override

  Widget build(BuildContext context) {
    final meal=ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            Container(
              width: double
              .infinity,
              height: 300,
              
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)
                ),
                child: Image.network(meal.imageUrl,fit: BoxFit.cover,)),
            ),
           _buildSectionTitle(context, "Ingredients"),
           
             _buildContainer(  ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx,index){
                    return Card(
                     
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                }),
            ),
            _buildSectionTitle(context, "Steps"),
               _buildContainer(  ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx,index){
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text("${index+1}"),),
                         title: Text(meal.steps[index]),
                        
                        ),
                        Divider(
                          thickness: 1,
                        )
                      ],
                    );
                }),
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_toggleFavourite(meal.id),
        child: Icon(
          isFavourite(meal.id) ? Icons.favorite : Icons.favorite_border 

        ),
        

      ),
      
    );
  }
}