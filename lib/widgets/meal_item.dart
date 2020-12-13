import 'package:flutter/material.dart';
import '../model/meal.dart';
class MealItem extends StatelessWidget {
  final Meal meal;
  MealItem(this.meal);
  String get complexityText{
    switch(meal.complexity){
      case Complexity.Simple :
        return "Simple";
        break;
      case Complexity.Challenging  :
        return 'Challenging';
        break;
      case Complexity.Hard:
        return "Hard";
        break;  
      default:
        return "Uknown";
    }
  }
  String get affordabilityText{
    switch(meal.affordability){
      case Affordability.Affordable :
        return "Affordable";
        break;
      case Affordability.Pricey  :
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return "Expensive";
        break;  
      default:
        return "Uknown";
    }
  }
  void _selectedMeal(){}
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: _selectedMeal, 
     child: Card(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(15),
       ),
       elevation: 4,
       margin: EdgeInsets.all(10),
       child: Column(
children: [
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(meal.imageUrl,height: 220,width: double.infinity,fit: BoxFit.cover,)),
              Container(
                height: 220,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                         topRight: Radius.circular(15),
                     ),
                     gradient: LinearGradient(
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       colors: [
                       Color(0xff343434).withOpacity(0.25),
                       Color(0xff343434).withOpacity(0.15),



                     ])
                   ),
                 ) ,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12,vertical: 36),
              child: Container(
                decoration: BoxDecoration(
                   color: Colors.black38,
                  borderRadius: BorderRadius.circular(8)),
                
               
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(meal.title,
                  style: TextStyle(color: Colors.white,fontSize: 24),
                  overflow: TextOverflow.fade,
                  softWrap: true,
                  ),
                ),
              ),
            )

        ],),
        Padding(
          padding:  EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Row(children: [
              Icon(Icons.schedule),
              SizedBox(width: 6,),
              Text("${meal.duration} min"),
            ],),

            
             Row(children: [
              Icon(Icons.work),
              SizedBox(width: 6,),
              Text("$complexityText"),
            ],),
               Row(children: [
              Icon(Icons.attach_money),
              SizedBox(width: 6,),
              Text("$affordabilityText"),
            ],),

          ],),
        )
         ],
       ),
     ),
    );
  }
}