// ignore_for_file: prefer_const_constructors

import 'package:coffee_shop/util/coffee_tile.dart';
import 'package:coffee_shop/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key: key);

  @override
    State<HomePage> createState()=>_HomePageState();
  }


class _HomePageState extends State<HomePage>{
   final List coffeeType=[
    [
      'Cappucino',true,
    ],
    [
      'Latte',false,
    ],
    [
      'Black',false,
    ],
    [
      'Tea',false,
    ],
  ];

  void coffeeTypeSelected(int index){
    setState((){
      for(int i=0; i<coffeeType.length;i++){
        coffeeType[i][1]=false;
      }
      coffeeType[index][1]=true;
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.grey[900],
      appBar: AppBar(
        elevation:0,
        backgroundColor:Colors.transparent,
        leading:Icon(Icons.menu),
        actions:[
          Padding(
          padding:const EdgeInsets.only(right:25.0),
          child: Icon(Icons.person)),],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label:'',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.favorite),
            label:''
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.notifications),
            label:'',
          )
        ],
      ),
      body: Column(children:[
        Padding(
          padding:const EdgeInsets.symmetric(horizontal:50.0),
          child: Text(
            "Find the best coffee for you",
            style: GoogleFonts.bebasNeue(
             fontSize: 56.0,
            ),
          ),
        ),
        const SizedBox(height:25),

       Padding(
        padding:const EdgeInsets.symmetric(horizontal:25.0),
        child: TextField(
          decoration:InputDecoration(
            prefixIcon:Icon(Icons.search),
            hintText:'Find your coffee..',
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(color:Colors.grey.shade600)
            ),
            enabledBorder:OutlineInputBorder(
              borderSide:BorderSide(color:Colors.grey.shade600),
            ),
            
            
          ),
          
        )
       ),
       const SizedBox(height:25),

       Container(
        height:50,
        child:ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:coffeeType.length,
          itemBuilder:(context,index){
          return CoffeeType(
            coffeeType:coffeeType[index][0],
            isSelected:coffeeType[index][1],
            onTap:(){
              coffeeTypeSelected(index);
            },
          );
        }
          
        )
       ),

       Expanded(
        child: ListView(
          scrollDirection:Axis.horizontal,
          children:[
           CoffeeTile(
            coffeeImagePath: 'lib/images/coffeee1.jpg',
            coffeeName:'Latte',
            coffeePrice:'4.20',
           ),
           CoffeeTile(
            coffeeImagePath: 'lib/images/coffeee2.jpg',
            coffeeName:'Cappucino',
            coffeePrice:'5.20',
           ),
           CoffeeTile(
            coffeeImagePath: 'lib/images/coffeee3.jpg',
            coffeeName:'Expresso',
            coffeePrice:'3.20',
           ),

          ]
        )
       )
      ]),
    
    );
  }
}